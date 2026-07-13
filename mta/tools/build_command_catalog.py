#!/usr/bin/env python3
"""Build the authoritative SA-MP command compatibility catalog.

The generated catalog is intentionally derived from the original Pawn sources.
It is used by the MTA port and CI so no command, alias or permission group can
silently disappear during the migration.
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path


COMMAND_RE = re.compile(r"(?:YCMD|CMD|COMMAND):([A-Za-z0-9_]+)\s*\(")
ALIAS_RE = re.compile(r'Command_AddAlt\s*\([^,]+,\s*"([^"]+)"\s*\)')
GLOBAL_RE = re.compile(r"Group_SetGlobalCommand\s*\([^,]+,\s*true\s*\)")
GROUP_RE = re.compile(r"Group_SetCommand\s*\(\s*([A-Za-z0-9_]+)")


def decode_source(path: Path) -> str:
    raw = path.read_bytes()
    for encoding in ("utf-8-sig", "cp1250", "latin-1"):
        try:
            return raw.decode(encoding)
        except UnicodeDecodeError:
            continue
    raise ValueError(f"Unable to decode {path}")


def load_json(path: Path) -> dict:
    return json.loads(decode_source(path))


def source_module(path: Path) -> str:
    parts = path.parts
    if "modules" in parts:
        index = parts.index("modules")
        if index + 1 < len(parts):
            return parts[index + 1]
    if "filterscripts" in parts:
        return "filterscripts"
    return "legacy"


def metadata_commands(repo: Path) -> dict[str, dict]:
    commands: dict[str, dict] = {}
    for metadata_path in sorted((repo / "gamemodes" / "modules").glob("**/command.json")):
        metadata = load_json(metadata_path)
        name = str(metadata["name"]).lower()
        command_dir = metadata_path.parent
        wrapper_candidates = sorted(command_dir.glob("cmd_*.pwn"))
        impl_candidates = sorted(command_dir.glob("*_impl.pwn"))
        wrapper = wrapper_candidates[0] if wrapper_candidates else None
        impl = impl_candidates[0] if impl_candidates else None
        entry = {
            "name": name,
            "aliases": sorted({str(alias).lower() for alias in metadata.get("aliases", [])}),
            "permissions": list(metadata.get("permissions", [])),
            "description": str(metadata.get("description", "")),
            "parameters": list(metadata.get("parameters", [])),
            "author": str(metadata.get("author", "")),
            "module": source_module(metadata_path.relative_to(repo)),
            "metadata_source": metadata_path.relative_to(repo).as_posix(),
            "wrapper_source": wrapper.relative_to(repo).as_posix() if wrapper else None,
            "implementation_source": impl.relative_to(repo).as_posix() if impl else None,
            "runtime": "amx-baseline",
            "native_mta_status": "pending",
        }
        if name in commands:
            existing = commands[name]
            if "variants" not in existing:
                existing["variants"] = [
                    {key: value for key, value in existing.items() if key not in {"variants", "alias_conflicts"}}
                ]
            existing["variants"].append(entry)
            existing["module"] = "multiple"
        else:
            commands[name] = entry
    return commands


def code_commands(repo: Path, commands: dict[str, dict]) -> None:
    roots = (repo / "gamemodes", repo / "filterscripts", repo / "include")
    for root in roots:
        for path in sorted(root.rglob("*")):
            if path.suffix.lower() not in {".pwn", ".inc"}:
                continue
            text = decode_source(path)
            for match in COMMAND_RE.finditer(text):
                name = match.group(1).lower()
                if name in commands:
                    continue
                permissions = ["everyone"] if GLOBAL_RE.search(text) else sorted(set(GROUP_RE.findall(text)))
                commands[name] = {
                    "name": name,
                    "aliases": sorted(set(alias.lower() for alias in ALIAS_RE.findall(text))),
                    "permissions": permissions,
                    "description": "",
                    "parameters": [],
                    "author": "",
                    "module": source_module(path.relative_to(repo)),
                    "metadata_source": None,
                    "wrapper_source": path.relative_to(repo).as_posix(),
                    "implementation_source": None,
                    "runtime": "amx-baseline",
                    "native_mta_status": "pending",
                }


def validate(commands: dict[str, dict]) -> None:
    aliases: dict[str, str] = {}
    for name, command in commands.items():
        if name != command["name"]:
            raise ValueError(f"Catalog key mismatch for {name}")
        for alias in command["aliases"]:
            owner = aliases.setdefault(alias, name)
            if owner != name:
                command.setdefault("alias_conflicts", []).append(owner)


def write_outputs(commands: dict[str, dict], output_dir: Path) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    ordered = [commands[name] for name in sorted(commands)]
    definition_count = sum(max(1, len(command.get("variants", []))) for command in ordered)
    document = {
        "schema_version": 1,
        "source": "MrucznikRolePlay/Mrucznik-RP-gamemode@master",
        "command_count": len(ordered),
        "definition_count": definition_count,
        "commands": ordered,
    }
    (output_dir / "commands.json").write_text(
        json.dumps(document, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    with (output_dir / "commands.csv").open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(("name", "aliases", "permissions", "module", "source", "native_mta_status"))
        for command in ordered:
            writer.writerow(
                (
                    command["name"],
                    " ".join(command["aliases"]),
                    " ".join(command["permissions"]),
                    command["module"],
                    command["implementation_source"] or command["wrapper_source"],
                    command["native_mta_status"],
                )
            )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument(
        "--output", type=Path, default=Path(__file__).resolve().parents[1] / "compatibility"
    )
    args = parser.parse_args()
    repo = args.repo.resolve()
    commands = metadata_commands(repo)
    code_commands(repo, commands)
    validate(commands)
    write_outputs(commands, args.output.resolve())
    print(f"Generated {len(commands)} commands in {args.output.resolve()}")


if __name__ == "__main__":
    main()
