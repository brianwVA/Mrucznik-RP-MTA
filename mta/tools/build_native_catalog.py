#!/usr/bin/env python3
"""Extract the native import table from the exact compiled Mrucznik AMX."""

from __future__ import annotations

import argparse
import json
import struct
import tarfile
from collections import Counter
from pathlib import Path


HEADER = struct.Struct("<I H B B h h 12i")
AMX_MEMBERS = {
    "M-RP": "serverfiles/gamemodes/Mrucznik-RP.amx",
    "animy": "serverfiles/filterscripts/animy.amx",
    "realtime": "serverfiles/filterscripts/realtime.amx",
    "sobeitblock": "serverfiles/filterscripts/sobeitblock.amx",
    "SAN_extPSq": "serverfiles/filterscripts/SAN_extPSq.amx",
    **{
        f"fs-count-{suffix}": f"serverfiles/scriptfiles/fs-count-{suffix}.amx"
        for suffix in "ABCDEFGHIJKLMNOP"
    },
    "callbackfix": "serverfiles/scriptfiles/callbackfix.amx",
}
CUSTOM_NATIVES = {
    "AddSimpleModel",
    "AddSimpleModelTimed",
    "FindTextureFileNameFromCRC",
    "FindModelFileNameFromCRC",
    "RedirectDownload",
    "PR_Init",
    "PR_RegHandler",
    "PR_SendRPC",
    "BS_New",
    "BS_Delete",
    "BS_IgnoreBits",
    "BS_SetWriteOffset",
    "BS_WriteValue",
    "BS_ReadValue",
    "mysql_connect",
    "mysql_debug",
    "mysql_fetch_field_row",
    "mysql_fetch_int",
    "mysql_fetch_row_format",
    "mysql_free_result",
    "mysql_insert_id",
    "mysql_num_rows",
    "mysql_ping",
    "mysql_query",
    "mysql_real_escape_string",
    "mysql_reconnect",
    "mysql_retrieve_row",
    "mysql_store_result",
    "Redis_Command",
    "Redis_Connect",
    "Redis_Exists",
    "Redis_GetInt",
    "Redis_GetString",
    "Redis_SetInt",
    "Redis_SetString",
}


def read_amx_programs(root: Path, explicit: Path | None) -> dict[str, bytes]:
    if explicit:
        return {"M-RP": explicit.read_bytes()}
    archive = root / "serverfiles.tar.gz"
    if not archive.exists() or archive.stat().st_size < 1024:
        raise FileNotFoundError("serverfiles.tar.gz is missing; run git lfs pull")
    with tarfile.open(archive, "r:gz") as tar:
        programs = {}
        compiled_gamemode = root / "gamemodes/Mrucznik-RP.amx"
        for name, member_name in AMX_MEMBERS.items():
            if name == "M-RP" and compiled_gamemode.exists() and compiled_gamemode.stat().st_size > 1024:
                programs[name] = compiled_gamemode.read_bytes()
                continue
            member = tar.getmember(member_name)
            source = tar.extractfile(member)
            if not source:
                raise FileNotFoundError(f"{member_name} is missing from serverfiles.tar.gz")
            programs[name] = source.read()
        return programs


def extract_names(amx: bytes) -> list[str]:
    if len(amx) < HEADER.size:
        raise ValueError("AMX header is truncated")
    header = HEADER.unpack_from(amx)
    size, magic, defsize = header[0], header[1], header[5]
    natives, libraries = header[12], header[13]
    # Debug symbols may be appended after the AMX image, so the header size can
    # be smaller than the physical file while still being valid.
    if magic != 0xF1E0 or size > len(amx) or defsize < 8:
        raise ValueError("Unsupported or corrupt AMX header")
    if not (0 <= natives <= libraries <= len(amx)):
        raise ValueError("Invalid AMX native table offsets")

    names: list[str] = []
    for offset in range(natives, libraries, defsize):
        _, name_offset = struct.unpack_from("<II", amx, offset)
        end = amx.find(b"\0", name_offset)
        if not (0 <= name_offset < end):
            raise ValueError("Invalid AMX native name offset")
        names.append(amx[name_offset:end].decode("ascii"))
    return names


def provider(name: str) -> str:
    if name in CUSTOM_NATIVES:
        return "mrp-mta-compat"
    if name == "PrintBacktrace":
        return "crashdetect"
    if name == "sscanf" or name.startswith("SSCANF_"):
        return "sscanf"
    if (
        name.startswith("Streamer_")
        or "Dynamic" in name
        or name in {"GetPlayerVisibleDynamicCP", "IsPointInDynamicArea"}
    ):
        return "streamer"
    if name.startswith("CA_"):
        return "ColAndreas"
    if name in {"Log", "CreateLog", "DestroyLog"}:
        return "log-plugin"
    if name.startswith("MEM_"):
        return "pawn-memory"
    if name.startswith("DCC_"):
        return "discord-connector"
    if name.startswith("regex_"):
        return "libRegEx"
    if name.startswith("Profiler_"):
        return "profiler"
    if name == "WP_Hash":
        return "Whirlpool"
    if (
        name.startswith("Json")
        or name.startswith("Request")
        or name == "RequestsClient"
    ):
        return "requests"
    return "mta-amx-core"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--amx", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    root = Path(__file__).resolve().parents[2]
    output = args.output or root / "mta/compatibility/natives.json"
    programs = {
        name: extract_names(amx)
        for name, amx in read_amx_programs(root, args.amx).items()
    }
    names = [native for program in programs.values() for native in program]
    counts = Counter(names)
    providers = Counter(provider(name) for name in counts)
    report = {
        "sources": [AMX_MEMBERS[name] for name in programs],
        "native_entry_count": len(names),
        "unique_native_count": len(counts),
        "programs": [
            {
                "name": name,
                "native_entry_count": len(program_names),
                "unique_native_count": len(set(program_names)),
            }
            for name, program_names in programs.items()
        ],
        "provider_counts": dict(sorted(providers.items())),
        "natives": [
            {"name": name, "occurrences": counts[name], "provider": provider(name)}
            for name in sorted(counts, key=str.casefold)
        ],
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Generated {len(counts)} unique natives from {len(names)} AMX entries")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
