#!/usr/bin/env python3
"""Build the Kotnik gamemode for the legacy MTA AMX bridge.

The bridge converts Pawn strings from Windows-1250 to UTF-8.  Kotnik sources
are UTF-8, so compiling them directly makes Polish characters get converted
twice.  This tool prepares a temporary CP1250 source tree and uses the stable
debug-compatible Pawn profile required by the bridge.  Repository sources are
never rewritten.
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import tempfile
from pathlib import Path


def convert_source_tree(root: Path) -> tuple[int, int, int]:
    converted = invalid_utf8 = replaced = 0
    for path in root.rglob("*"):
        if not path.is_file() or path.suffix.lower() not in {".pwn", ".inc"}:
            continue
        raw = path.read_bytes()
        if raw.isascii():
            continue
        try:
            text = raw.decode("utf-8")
        except UnicodeDecodeError:
            # A few third-party includes are already stored in an ANSI codepage.
            invalid_utf8 += 1
            continue
        try:
            encoded = text.encode("cp1250")
        except UnicodeEncodeError:
            encoded = text.encode("cp1250", errors="replace")
            replaced += 1
        path.write_bytes(encoded)
        converted += 1
    return converted, invalid_utf8, replaced


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--source-root",
        type=Path,
        default=Path(__file__).resolve().parents[2] / "KOTNIKRP",
    )
    parser.add_argument("--compiler", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    source_root = args.source_root.resolve()
    compiler = (args.compiler or source_root / "pawncc" / "pawncc.exe").resolve()
    output = (args.output or source_root / "gamemodes" / "Kotnik-RP-MTA.amx").resolve()
    if not compiler.is_file():
        raise SystemExit(f"Pawn compiler not found: {compiler}")

    with tempfile.TemporaryDirectory(prefix="mrp-kotnik-cp1250-") as tmp:
        work = Path(tmp)
        shutil.copytree(source_root / "gamemodes", work / "gamemodes")
        shutil.copytree(source_root / "pawncc" / "include", work / "pawncc" / "include")
        converted, invalid_utf8, replaced = convert_source_tree(work)

        command = [
            str(compiler),
            "-i../pawncc/include/",
            "Kotnik-RP-MTA.pwn",
            "-;+",
            "-(+",
            "-d3",
            "-Z+",
        ]
        subprocess.run(command, cwd=work / "gamemodes", check=True)
        built = work / "gamemodes" / "Kotnik-RP-MTA.amx"
        output.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(built, output)

    print(
        f"Built {output} ({output.stat().st_size} bytes); "
        f"converted={converted}, ansi_includes={invalid_utf8}, replacements={replaced}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
