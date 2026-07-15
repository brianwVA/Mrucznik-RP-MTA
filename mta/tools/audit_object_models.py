#!/usr/bin/env python3
"""Audit SA-MP/MTA object coverage against Mrucznik's original sources.

The gamemode uses three object namespaces at once: GTA:SA objects, SA-MP 0.3.7
objects and negative Vice City 0.3.DL models.  This tool verifies the two
custom namespaces, including Vice City's table-driven IPL placements which do
not appear as literal CreateObject calls.
"""

from __future__ import annotations

import argparse
import hashlib
import re
import sys
from dataclasses import dataclass
from pathlib import Path

from build_vc_model_catalog import (
    ALLOWED_LOD_MODELS,
    ENTRY as VC_ENTRY,
    TEXTURE_ALIASES,
)
from import_samp_objects import (
    read_ide,
    read_img_directory,
    split_col_archive,
)


LUA_MODEL = re.compile(
    r"MRP_OBJECT_MODELS\[(-?\d+)\]\s*=\s*\{([^}]*)\}", re.MULTILINE
)
LUA_FIELD = re.compile(r'\b(dff|txd|col)\s*=\s*"([^"]+)"')
PAWN_OBJECT_CALL = re.compile(
    r"\b(\w*Create(?:Dynamic|Player)?Object\w*)"
    r"\s*\(\s*(-?\d+)\b"
)

# This is an open-door mesh in one mansion interior. The distributed vc4samp
# archive has the closed variant only; omitting the mesh leaves the doorway in
# the same open state and is safer than substituting a blocking closed door.
SAFE_SOURCE_OMISSIONS = {-6634}


@dataclass(frozen=True)
class Definition:
    dff: str
    txd: str
    col: str | None = None


def strip_pawn_comments_and_strings(text: str) -> str:
    """Replace Pawn comments and quoted literals while preserving newlines."""

    output: list[str] = []
    index = 0
    state = "code"
    while index < len(text):
        char = text[index]
        following = text[index + 1] if index + 1 < len(text) else ""
        if state == "code":
            if char == "/" and following == "/":
                output.extend("  ")
                index += 2
                state = "line_comment"
                continue
            if char == "/" and following == "*":
                output.extend("  ")
                index += 2
                state = "block_comment"
                continue
            if char in {'"', "'"}:
                output.append(" ")
                index += 1
                state = "string" if char == '"' else "character"
                continue
            output.append(char)
            index += 1
            continue
        if state == "line_comment":
            if char in "\r\n":
                output.append(char)
                state = "code"
            else:
                output.append(" ")
            index += 1
            continue
        if state == "block_comment":
            if char == "*" and following == "/":
                output.extend("  ")
                index += 2
                state = "code"
            else:
                output.append(char if char in "\r\n" else " ")
                index += 1
            continue
        # Pawn uses backslash escapes in strings and character literals.
        quote = '"' if state == "string" else "'"
        if char == "\\" and following:
            output.append(" ")
            output.append(following if following in "\r\n" else " ")
            index += 2
        elif char == quote:
            output.append(" ")
            index += 1
            state = "code"
        else:
            output.append(char if char in "\r\n" else " ")
            index += 1
    return "".join(output)


def pawn_array(text: str, name: str) -> str:
    match = re.search(
        rf"new\s+{re.escape(name)}\s*\[\]\s*(?:\[[^\]]+\])?\s*=\s*\{{(.*?)\n\}};",
        text,
        re.DOTALL,
    )
    if not match:
        raise ValueError(f"Pawn array not found: {name}")
    return match.group(1)


def parse_lua_registries(paths: list[Path]) -> dict[int, Definition]:
    result: dict[int, Definition] = {}
    for path in paths:
        if not path.is_file():
            continue
        for match in LUA_MODEL.finditer(path.read_text(encoding="utf-8")):
            fields = dict(LUA_FIELD.findall(match.group(2)))
            if "dff" in fields and "txd" in fields:
                result[int(match.group(1))] = Definition(
                    fields["dff"], fields["txd"], fields.get("col")
                )
    return result


def relative_assets_from_meta(meta: Path) -> set[str]:
    text = meta.read_text(encoding="utf-8")
    return {
        value.replace("\\", "/").lower()
        for value in re.findall(r'<file\s+src="([^"]+)"', text)
    }


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_img_entry(path: Path, entry: tuple[int, int]) -> bytes:
    offset, size = entry
    with path.open("rb") as handle:
        handle.seek(offset)
        return handle.read(size)


def audit_samp_source(
    gta: Path,
    resource: Path,
    definitions: dict[int, Definition],
    meta_files: set[str],
) -> tuple[set[int], list[str]]:
    errors: list[str] = []
    samp = gta / "SAMP"
    ide = samp / "SAMP.ide"
    samp_img = samp / "SAMP.img"
    col_img = samp / "SAMPCOL.img"
    for required in (ide, samp_img, col_img):
        if not required.is_file():
            return set(), [f"missing SA-MP source file: {required}"]

    image_entries: dict[str, tuple[Path, tuple[int, int]]] = {
        name: (samp_img, entry)
        for name, entry in read_img_directory(samp_img).items()
    }
    for image in sorted((gta / "models").glob("*.img")):
        for name, entry in read_img_directory(image).items():
            image_entries.setdefault(name, (image, entry))
    collisions = split_col_archive(col_img)
    checked_assets: set[str] = set()
    source_ids: set[int] = set()

    for model, dff_name, txd_name in read_ide(ide):
        source_ids.add(model)
        definition = definitions.get(model)
        if not definition:
            errors.append(f"SA-MP model {model} has no registry definition")
            continue
        expected_dff = f"{dff_name}.dff".lower()
        expected_txd = f"{txd_name}.txd".lower()
        if Path(definition.dff).name.lower() != expected_dff:
            errors.append(
                f"SA-MP model {model} DFF mismatch: {definition.dff} != {expected_dff}"
            )
        if Path(definition.txd).name.lower() != expected_txd:
            errors.append(
                f"SA-MP model {model} TXD mismatch: {definition.txd} != {expected_txd}"
            )

        source_assets: list[tuple[str, bytes]] = []
        for filename, relative in (
            (expected_dff, definition.dff),
            (expected_txd, definition.txd),
        ):
            source_entry = image_entries.get(filename)
            loose = gta / "models" / filename
            if source_entry:
                source_data = read_img_entry(*source_entry)
            elif loose.is_file():
                source_data = loose.read_bytes()
            else:
                errors.append(f"SA-MP source asset missing for model {model}: {filename}")
                continue
            source_assets.append((relative, source_data))

        collision = collisions.get(dff_name.lower())
        if collision:
            if not definition.col:
                errors.append(f"SA-MP model {model} is missing its COL definition")
            else:
                source_assets.append((definition.col, collision))

        for relative, source_data in source_assets:
            normalized = relative.replace("\\", "/")
            if normalized.lower() not in meta_files:
                errors.append(f"asset absent from meta.xml: {normalized}")
            if normalized.lower() in checked_assets:
                continue
            checked_assets.add(normalized.lower())
            installed = resource / Path(normalized)
            if not installed.is_file():
                errors.append(f"registry asset missing on disk: {normalized}")
            elif digest(installed.read_bytes()) != digest(source_data):
                errors.append(f"asset differs from original SA-MP archive: {normalized}")

    return source_ids, errors


def audit_vc_source(
    source: Path,
    resource: Path,
    definitions: dict[int, Definition],
    meta_files: set[str],
) -> tuple[set[int], dict[int, tuple[str, str]], list[str]]:
    errors: list[str] = []
    text = source.read_text(encoding="cp1250", errors="strict")
    assets = resource / "assets" / "vc4samp"
    expected: dict[int, Definition] = {}
    unavailable: dict[int, tuple[str, str]] = {}
    source_ids: set[int] = set()

    for match in VC_ENTRY.finditer(text):
        model = int(match.group(1))
        dff = match.group(2)
        txd = match.group(3)
        time_on = int(match.group(4)) if match.group(4) else None
        source_ids.add(model)
        if time_on is None and "lod" in dff.lower() and model not in ALLOWED_LOD_MODELS:
            continue
        txd_on_disk = txd
        if not (assets / "txd" / txd_on_disk).is_file() and txd in TEXTURE_ALIASES:
            alias = TEXTURE_ALIASES[txd]
            if (assets / "txd" / alias).is_file():
                txd_on_disk = alias
        dff_exists = (assets / "dff" / dff).is_file()
        txd_exists = (assets / "txd" / txd_on_disk).is_file()
        if not dff_exists or not txd_exists:
            unavailable[model] = (
                "" if dff_exists else dff,
                "" if txd_exists else txd_on_disk,
            )
            continue
        expected[model] = Definition(
            f"assets/vc4samp/dff/{dff}", f"assets/vc4samp/txd/{txd_on_disk}"
        )
        unavailable.pop(model, None)

    for model, wanted in expected.items():
        actual = definitions.get(model)
        if not actual:
            errors.append(f"Vice City model {model} has no registry definition")
            continue
        if actual.dff.lower() != wanted.dff.lower() or actual.txd.lower() != wanted.txd.lower():
            errors.append(
                f"Vice City model {model} mismatch: {actual.dff}, {actual.txd}"
            )
        for relative in (actual.dff, actual.txd):
            if relative.lower() not in meta_files:
                errors.append(f"asset absent from meta.xml: {relative}")
            if not (resource / Path(relative)).is_file():
                errors.append(f"registry asset missing on disk: {relative}")
    return source_ids, unavailable, errors


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--resource", type=Path, required=True)
    parser.add_argument("--gta", type=Path)
    args = parser.parse_args()

    repo = args.repo.resolve()
    resource = args.resource.resolve()
    vc_source = repo / "gamemodes/modules/vicecity/vicecity_map.pwn"
    registry_paths = [
        resource / "shared/registry.lua",
        resource / "shared/samp_objects.lua",
        resource / "shared/vc_objects.lua",
    ]
    definitions = parse_lua_registries(registry_paths)
    meta_files = relative_assets_from_meta(resource / "meta.xml")
    errors: list[str] = []
    warnings: list[str] = []

    vc_ids, unavailable_vc, vc_errors = audit_vc_source(
        vc_source, resource, definitions, meta_files
    )
    errors.extend(vc_errors)
    if args.gta:
        samp_ids, samp_errors = audit_samp_source(
            args.gta.resolve(), resource, definitions, meta_files
        )
        errors.extend(samp_errors)
    else:
        samp_ids = {
            model
            for model, definition in definitions.items()
            if definition.dff.lower().startswith("assets/samp037/")
        }
        warnings.append("SA-MP archive/hash comparison skipped (pass --gta)")

    vc_text = strip_pawn_comments_and_strings(
        vc_source.read_text(encoding="cp1250", errors="strict")
    )
    placements = [
        (int(match.group(1)), int(match.group(2)), float(match.group(3)),
         float(match.group(4)), float(match.group(5)))
        for match in re.finditer(
            r"\{\s*(-?\d+)\s*,\s*(-?\d+)\s*,\s*([-+\d.]+)\s*,"
            r"\s*([-+\d.]+)\s*,\s*([-+\d.]+)",
            pawn_array(vc_text, "ipl_infos"),
        )
    ]
    lod_ids = {
        int(value)
        for value in re.findall(
            r"(?m)^\s*(-?\d+)\s*,?", pawn_array(vc_text, "LOD_IDs")
        )
    }
    active_placements = [placement for placement in placements if placement[0] not in lod_ids]
    custom_namespace = vc_ids | samp_ids
    custom_placements = [
        placement
        for placement in active_placements
        if placement[0] in custom_namespace or placement[0] < 321 or placement[0] > 18630
    ]
    missing_placements = [
        placement for placement in custom_placements if placement[0] not in definitions
    ]
    for model in sorted({placement[0] for placement in missing_placements}):
        examples = [placement for placement in missing_placements if placement[0] == model]
        location = examples[0][1:]
        message = (
            f"active Vice City IPL model {model} is unavailable "
            f"({len(examples)} placement(s), first int/x/y/z={location})"
        )
        if model in SAFE_SOURCE_OMISSIONS:
            warnings.append(message + "; safe open-door omission")
        else:
            errors.append(message)

    literal_models: set[int] = set()
    literal_calls = 0
    for root_name in ("gamemodes", "filterscripts", "include"):
        for path in (repo / root_name).rglob("*"):
            if path.suffix.lower() not in {".pwn", ".inc"}:
                continue
            text = strip_pawn_comments_and_strings(
                path.read_text(encoding="cp1250", errors="replace")
            )
            for match in PAWN_OBJECT_CALL.finditer(text):
                literal_calls += 1
                literal_models.add(int(match.group(2)))
    missing_literals = sorted(
        model
        for model in literal_models
        if (model in custom_namespace or model < 0 or model > 18630)
        and model not in definitions
    )
    for model in missing_literals:
        errors.append(f"active literal custom object model {model} is unavailable")

    for model, missing in sorted(unavailable_vc.items()):
        if model not in {placement[0] for placement in missing_placements}:
            names = ", ".join(name for name in missing if name)
            warnings.append(f"unused Vice City definition {model} lacks: {names}")

    referenced_assets = {
        path.lower()
        for definition in definitions.values()
        for path in (definition.dff, definition.txd, definition.col)
        if path
    }
    for relative in sorted(referenced_assets):
        if relative not in meta_files:
            errors.append(f"registry asset absent from meta.xml: {relative}")
        if not (resource / Path(relative)).is_file():
            errors.append(f"registry asset absent from resource: {relative}")

    print(
        "Object audit: "
        f"{len(definitions)} custom definitions; "
        f"{len(active_placements)} active VC IPL placements; "
        f"{len(custom_placements)} custom VC placements; "
        f"{literal_calls} literal object calls / {len(literal_models)} model IDs"
    )
    for warning in warnings:
        print(f"WARNING: {warning}")
    if errors:
        for error in dict.fromkeys(errors):
            print(f"ERROR: {error}")
        print(f"FAILED: {len(set(errors))} object audit error(s)")
        return 1
    print("PASS: every loadable active custom object has its original registry and assets")
    return 0


if __name__ == "__main__":
    sys.exit(main())
