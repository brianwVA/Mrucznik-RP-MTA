#!/usr/bin/env python3
"""Static validation for the reproducible MTA compatibility build."""

from __future__ import annotations

import json
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path


def fail(message: str) -> None:
    raise ValueError(message)


def main() -> int:
    mta = Path(__file__).resolve().parents[1]
    commands = json.loads((mta / "compatibility/commands.json").read_text(encoding="utf-8"))
    models = json.loads((mta / "compatibility/models.json").read_text(encoding="utf-8"))
    natives = json.loads((mta / "compatibility/natives.json").read_text(encoding="utf-8"))
    plugins = json.loads((mta / "plugins.lock.json").read_text(encoding="utf-8"))
    if commands["command_count"] != 788 or commands["definition_count"] != 788:
        fail("Unexpected command inventory size")
    if commands.get("runtime_command_count") != 746:
        fail("Unexpected compiled AMX command inventory size")
    if commands.get("inactive_source_command_count") != 42:
        fail("Unexpected inactive source command inventory size")
    runtime_commands = {
        command["name"]
        for command in commands["commands"]
        if command.get("compiled_runtime") is True
    }
    if len(runtime_commands) != commands["runtime_command_count"]:
        fail("Compiled command flags do not match the runtime inventory")
    if models["model_count"] != 81:
        fail("Unexpected 0.3.DL ped model inventory size")
    if models.get("samp_object_count") != 1:
        fail("Unexpected SA-MP object model inventory size")
    if natives["native_entry_count"] != 552 or natives["unique_native_count"] != 471:
        fail("Unexpected compiled AMX native inventory size")
    programs = {program["name"]: program for program in natives["programs"]}
    if programs.get("M-RP", {}).get("native_entry_count") != 510:
        fail("Unexpected gamemode native inventory size")
    expected_programs = {
        "M-RP", "animy", "realtime", "sobeitblock", "SAN_extPSq",
        "callbackfix", *(f"fs-count-{suffix}" for suffix in "ABCDEFGHIJKLMNOP"),
    }
    if set(programs) != expected_programs:
        fail("Native catalog does not cover every runtime AMX")
    if plugins.get("platform") != "windows-x86" or len(plugins.get("plugins", [])) != 10:
        fail("Unexpected Windows plugin lock inventory")
    plugin_names = [plugin["name"] for plugin in plugins["plugins"]]
    load_names = [plugin["load_name"] for plugin in plugins["plugins"]]
    if len(plugin_names) != len(set(plugin_names)) or len(load_names) != len(set(load_names)):
        fail("Plugin names and load names must be unique")
    for plugin in plugins["plugins"]:
        if not re.fullmatch(r"[0-9a-f]{64}", plugin.get("sha256", "")):
            fail(f"Plugin {plugin['name']} does not have a pinned SHA-256")
        if not plugin.get("url", "").startswith("https://github.com/"):
            fail(f"Plugin {plugin['name']} must use its primary GitHub release")
        if not plugin.get("files"):
            fail(f"Plugin {plugin['name']} has no installed files")
    destinations: dict[str, list[str]] = {}
    for plugin in plugins["plugins"]:
        for destination in plugin["files"].values():
            destinations.setdefault(destination, []).append(plugin["name"])
    overwrites = {
        destination: owners
        for destination, owners in destinations.items()
        if len(owners) > 1
    }
    for destination, owners in overwrites.items():
        if plugins.get("allowed_overwrites", {}).get(destination) != owners[-1]:
            fail(f"Undeclared plugin overwrite for {destination}: {owners}")
    replaced = {item["name"] for item in plugins.get("replaced_by_mta", [])}
    if replaced != {"Pawn.RakNet", "bscrashfix", "mysql R5", "pawn-redis"}:
        fail("Unexpected set of SA-MP process plugins replaced by MTA")
    built_load_names = {plugin["load_name"] for plugin in plugins.get("built_plugins", [])}
    imported_providers = set(natives["provider_counts"]) - {
        "mta-amx-core",
        "mrp-mta-compat",
    }
    if imported_providers != set(load_names) | built_load_names:
        fail("Plugin lock does not cover every provider imported by the AMX")

    for meta in sorted(mta.rglob("meta.xml")):
        root = ET.parse(meta).getroot()
        for node in root.findall("script") + root.findall("file"):
            source = node.get("src")
            if not source:
                fail(f"Missing src in {meta}")
            path = meta.parent / source
            if not path.exists():
                fail(f"Missing resource file {path} referenced by {meta}")

    setup = (mta / "setup.ps1").read_text(encoding="utf-8")
    if "e15e50239e7bf488ec433e597c6d19f30bbbe6e543f449af6ec182b5ed870c3f" not in setup:
        fail("MTA AMX archive checksum is not pinned")
    if "17f3455d20083782e897fe9bb7ce45f0349d1fd2fc74975a990db1f8344f7625" not in setup:
        fail("Object Preview archive checksum is not pinned")
    for asset_hash in {
        "3f41e84551b6d7ed04f66cbe5fcaad2e8cb1734ace8380a4b8a56200c3e8e87c",
        "3c37105bc9bd3612ad6fcf5e79e35312ae7c401b6a95b74cae43cf236f363241",
        "beb1aca6de4ac61601ff016f5fc79954f0e0a1335010e7dde5989bd53316e67c",
    }:
        if asset_hash not in setup:
            fail("SA-MP wall025 assets are not checksum-pinned")
    if "scriptfiles\\colandreas\\ColAndreas.cadb" not in setup:
        fail("Installer does not place the ColAndreas database at process-relative path")
    if 'foreach ($Suffix in [char[]](65..80))' not in setup:
        fail("Installer does not package every dynamic fixes.inc filterscript")
    if '$PackagedFilterScripts["callbackfix"]' not in setup:
        fail("Installer does not package the dynamic callback filterscript")
    if 'Join-Path $MtaServerRoot "models"' not in setup:
        fail("Installer does not place DFF files at the ColAndreas process-relative path")
    if "$RootMysqlConfig" not in setup or "$RootRedisConfig" not in setup:
        fail("Installer does not mirror Pawn database configs to the process-relative path")
    if "6a55e642f88de29531c1c6cc57516e16a94247a1" not in (
        mta / "vendor/mta-amx/UPSTREAM.md"
    ).read_text(encoding="utf-8"):
        fail("Vendored MTA AMX commit is not documented")
    if "10447436f9fd22000192b34ad5ffbf582e431c46" not in (
        mta / "vendor/colandreas/UPSTREAM.md"
    ).read_text(encoding="utf-8"):
        fail("Vendored ColAndreas commit is not documented")
    amx_module = (mta / "vendor/mta-amx/amx-deps/src/ml_base.cpp").read_text(
        encoding="utf-8"
    )
    amx_build = (mta / "vendor/mta-amx/amx-deps/src/premake5.lua").read_text(
        encoding="utf-8"
    )
    if "WSAStartup(MAKEWORD(2, 2)" not in amx_module or '"Ws2_32"' not in amx_build:
        fail("AMX module does not initialize Winsock for legacy network plugins")
    compatibility = "\n".join(
        (mta / f"vendor/mta-amx/amx/server/{name}").read_text(encoding="utf-8")
        for name in ("mrp_compat.lua", "mrp_databases.lua")
    )
    object_compatibility = (
        mta / "vendor/mta-amx/amx/server/mrp_compat.lua"
    ).read_text(encoding="utf-8")
    if "return 1337, logicalModel" not in object_compatibility:
        fail("Unknown custom object IDs can leak a visible 1337 placeholder")
    if "return logicalModel, false" not in object_compatibility:
        fail("Stock object model IDs are not preserved by the compatibility layer")
    suppressed_wps_positions = {
        "2511.49, -2020.82, 13.20", "2525.22, -2015.97, 13.20",
        "2525.18, -1999.27, 13.43", "2504.39, -1998.48, 13.20",
        "2480.99, -1995.30, 13.20", "2463.91, -1995.87, 13.34",
        "2469.20, -2020.50, 13.20", "2441.65, -2020.67, 13.20",
        "2482.57, -2021.26, 13.20",
    }
    if not all(position in object_compatibility for position in suppressed_wps_positions) or (
        "MRP_SUPPRESSED_OBJECT_MODEL" not in object_compatibility
        or "mrpIsSuppressedLegacyObject" not in object_compatibility
    ):
        fail("Obsolete WPS street-bin placements are not suppressed exactly")
    compatibility_natives = {
        native["name"]
        for native in natives["natives"]
        if native["provider"] == "mrp-mta-compat"
    }
    for native in compatibility_natives:
        if f"g_SAMPSyscallPrototypes.{native}" not in compatibility:
            fail(f"Missing MTA compatibility prototype for {native}")

    # An imported native may exist in the upstream syscall table while still
    # being only a notImplemented() placeholder. Treat that as a release
    # blocker: every function the exact compiled AMX can call needs a real path.
    imported_names = {native["name"] for native in natives["natives"]}
    function_pattern = re.compile(
        r"function\s+(\w+)\([^)]*\)(.*?)(?=\nfunction\s+|\Z)", re.DOTALL
    )
    for lua_path in sorted((mta / "vendor/mta-amx/amx/server").rglob("*.lua")):
        lua = lua_path.read_text(encoding="utf-8")
        for match in function_pattern.finditer(lua):
            if match.group(1) in imported_names and "notImplemented(" in match.group(2):
                fail(
                    f"Imported native remains a placeholder: "
                    f"{match.group(1)} ({lua_path})"
                )

    # The loaded sobeitblock AMX treats a missing SendClientCheck callback as a
    # cheat result. These exact clean responses are therefore a runtime
    # contract, not an optional stub, even though SA-MP process addresses have
    # no direct meaning inside the MTA client.
    samp_natives = (
        mta / "vendor/mta-amx/amx/server/natives/a_samp.lua"
    ).read_text(encoding="utf-8")
    client_check = re.search(
        r"function SendClientCheck\([^)]*\)(.*?)(?=\nfunction\s+|\Z)",
        samp_natives,
        re.DOTALL,
    )
    required_client_check_tokens = {
        "OnClientCheckResponse",
        "0x5E8606",
        "204",
        "0x3A9ED",
        "136",
    }
    if not client_check or not required_client_check_tokens.issubset(
        set(re.findall(r"OnClientCheckResponse|0x[0-9A-Fa-f]+|\b\d+\b", client_check.group(1)))
    ):
        fail("SendClientCheck does not preserve the active sobeitblock callback contract")

    if '"amx-mrucznik"' not in setup:
        fail("Installer does not autostart the Mrucznik gamemode")
    startup_loop = re.search(r"foreach \(\$ResourceName in @\(([^)]+)\)\)", setup)
    startup_order = re.findall(r'"([^"]+)"', startup_loop.group(1)) if startup_loop else []
    expected_startup_order = [
        "object_preview", "mrp_models", "amx", "mrp_bridge"
    ]
    if startup_order != expected_startup_order:
        fail("MTA resources are not installed in a safe startup order")

    bridge_server = (
        mta / "server/mods/deathmatch/resources/mrp_bridge/server/main.lua"
    ).read_text(encoding="utf-8")
    bridge_client = (
        mta / "server/mods/deathmatch/resources/mrp_bridge/client/main.lua"
    ).read_text(encoding="utf-8")
    if 'getResourceState(amx) ~= "running"' not in bridge_server:
        fail("Bridge can start the Pawn gamemode before AMX is ready")
    if "setPlayerNametagShowing" in bridge_server:
        fail("Bridge must not override SA-MP nametag behavior")
    if 'setPlayerHudComponentVisible("money"' in bridge_client:
        fail("Bridge must not hide the SA-MP money HUD")
    required_input_tokens = {
        'toggleControl("chatbox", true)',
        'key ~= "y"',
        'cancelEvent()',
        'triggerServerEvent("mrp:conversationYes"',
        'addCommandHandler("q"',
        'triggerServerEvent("mrp:requestQuit"',
    }
    if not all(token in bridge_client for token in required_input_tokens):
        fail("Bridge does not preserve SA-MP chat, Y and /q controls")

    amx_events = (
        mta / "vendor/mta-amx/amx/server/events.lua"
    ).read_text(encoding="utf-8")
    raw_input = re.search(
        r"addEvent\('mrp:rawInput', true\)(.*?)(?=\naddEventHandler\('onPlayerWeaponSwitch')",
        amx_events,
        re.DOTALL,
    )
    if (
        not raw_input
        or "procCallOnAll('OnPlayerCommandText'" not in raw_input.group(1)
        or "g_CommandMapping" in raw_input.group(1)
    ):
        fail("Raw input does not dispatch exact command names to the original Pawn handler")
    required_compat_events = {
        "addEvent('mrp:conversationYes', true)",
        "keyStateChange(client, 'conversation_yes'",
        "addEvent('mrp:requestQuit', true)",
        "setElementData(client, 'mrp:requestedQuit'",
        "kickPlayer(client, 'Quit')",
        "getElementData(source, 'mrp:requestedQuit') and 1",
    }
    if not all(token in amx_events for token in required_compat_events):
        fail("AMX bridge does not preserve SA-MP Y and /q semantics")

    amx_loader = (
        mta / "vendor/mta-amx/amx/server/amx.lua"
    ).read_text(encoding="utf-8")
    if (
        "debug.sethook(nil)" not in amx_loader
        or "type(watchdogHook) == 'function'" not in amx_loader
        or "debug.sethook(watchdogHook" not in amx_loader
    ):
        fail("Heavy Pawn initialization is not isolated from and restored to the MTA watchdog")

    models_client = (
        mta / "server/mods/deathmatch/resources/mrp_models/client/main.lua"
    ).read_text(encoding="utf-8")
    models_server = (
        mta / "server/mods/deathmatch/resources/mrp_models/server/main.lua"
    ).read_text(encoding="utf-8")
    models_meta = ET.parse(
        mta / "server/mods/deathmatch/resources/mrp_models/meta.xml"
    ).getroot()
    model_scripts = [node.get("src") for node in models_meta.findall("script")]
    if "shared/vc_objects.lua" not in model_scripts:
        fail("Vice City shared object catalog is not loaded by mrp_models")
    vc_catalog = (
        mta / "server/mods/deathmatch/resources/mrp_models/shared/vc_objects.lua"
    ).read_text(encoding="utf-8")
    if len(re.findall(r"MRP_OBJECT_MODELS\[-\d+\]", vc_catalog)) != 2747:
        fail("Unexpected loadable Vice City object inventory size")
    for repaired_texture in ("docksvc.txd", "subcratesvc.txd"):
        if repaired_texture not in vc_catalog:
            fail(f"Vice City texture alias is absent: {repaired_texture}")
    material_shader = (
        mta / "server/mods/deathmatch/resources/mrp_models/client/material_replace.fx"
    ).read_text(encoding="utf-8")
    if "engineGetModelTextures(model" not in models_client:
        fail("Player-object materials cannot resolve stock GTA model textures")
    if "engineLoadCOL(definition.col)" not in models_client or "engineReplaceCOL(col, runtimeModel)" not in models_client:
        fail("SA-MP object models do not load their exact collision data")
    if "loadEmbeddedObjectCOL" not in models_client or "engineLoadCOL(raw)" not in models_client:
        fail("Vice City objects do not load the COL data embedded by SA-MP")
    if "engineSetModelVisibleTime(runtimeModel, timeOn, timeOff)" not in models_client:
        fail("Vice City day/night models ignore their original visibility times")
    if "engineSetModelLODDistance(runtimeModel, 1000, true)" not in models_client:
        fail("Custom objects do not use the extended one-kilometre draw distance")
    required_model_streaming_tokens = {
        'addEventHandler("onClientElementStreamOut", root',
        "OBJECT_MODEL_RELEASE_DELAY",
        "freeCustomObjectModel(model)",
        "OBJECT_MODEL_LOAD_INTERVAL",
        "processObjectModelLoadQueue",
        "engineSetAsynchronousLoading(true, false)",
        "destroyEngineAsset(loaded.dff)",
    }
    if not all(token in models_client for token in required_model_streaming_tokens):
        fail("Custom object models are not streamed and released safely")
    amx_client = (
        mta / "vendor/mta-amx/amx/client/client.lua"
    ).read_text(encoding="utf-8")
    if "engineSetModelLODDistance(model, MRP_OBJECT_DRAW_DISTANCE, true)" not in amx_client:
        fail("Stock script objects do not use the extended draw distance")
    attached_objects = (
        mta / "vendor/mta-amx/amx/server/natives/a_players.lua"
    ).read_text(encoding="utf-8")
    if "if customModel or not tonumber(modelid)" not in attached_objects:
        fail("Attached custom object placeholders can become visible")
    object_natives = (
        mta / "vendor/mta-amx/amx/server/natives/a_objects.lua"
    ).read_text(encoding="utf-8")
    if object_natives.count("mrpIsSuppressedLegacyObject(model, x, y, z)") != 2:
        fail("Legacy-object suppression does not cover global and player objects")
    colandreas_streamer = (mta.parent / "gamemodes/system/mrp_object_distance.inc").read_text(
        encoding="utf-8"
    )
    if colandreas_streamer.count("MRP_ExpandObjectDistances(streamdistance, drawdistance);") != 2:
        fail("Dynamic object streaming distance is not expanded globally")
    if 'addEventHandler("onClientResourceStop", resourceRoot' not in models_client or (
        "engineFreeModel(runtimeModel)" not in models_client
    ):
        fail("Custom model IDs are leaked across mrp_models resource restarts")
    if "pairs(MRP_OBJECT_MODELS or {})" not in models_client:
        fail("Client does not initialize the complete shared object catalog")
    if "getElementModel(object) == runtimeModel" not in models_client:
        fail("Repeated custom-object application can hide an already loaded model")
    if "MRP model audit" in models_client or "mrpmodelaudit" in models_client:
        fail("Temporary object-model diagnostics remain enabled")
    if "runtimeObjectModels" not in models_server or (
        'triggerClientEvent(client, "mrp:onObjectModelsReady", resourceRoot, runtimeObjectModels)'
        not in models_server
    ):
        fail("Server still transfers the full shared object catalog as one event")
    if 'dxSetShaderValue(shader, "materialColor"' not in models_client:
        fail("Player-object material ARGB colors are not forwarded to the shader")
    if "materialColor" not in material_shader or "replaceMaterial" not in material_shader:
        fail("Player-object material shader does not apply its SA-MP color")
    print("MTA project structure is valid")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (ValueError, ET.ParseError, json.JSONDecodeError) as error:
        print(error, file=sys.stderr)
        raise SystemExit(1)
