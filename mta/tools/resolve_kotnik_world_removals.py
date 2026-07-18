#!/usr/bin/env python3
"""Resolve SA-MP RemoveBuildingForPlayer(-1, ...) against GTA SA IPL data.

MTA has no wildcard model ID. The old compatibility bridge emulated -1 by
calling removeWorldModel for every ID from 321 through 18630, which froze the
client during login. This tool expands each wildcard to the concrete model IDs
placed inside the requested sphere, using both text IPLs and gta3.img binary
stream IPLs.
"""

from __future__ import annotations

import argparse
import re
import struct
from pathlib import Path


WILDCARD = re.compile(
    r"^(?P<indent>\s*)RemoveBuildingForPlayer\s*\(\s*playerid\s*,\s*-1\s*,"
    r"\s*(?P<x>[-\d.]+)\s*,\s*(?P<y>[-\d.]+)\s*,\s*(?P<z>[-\d.]+)\s*,"
    r"\s*(?P<radius>[-\d.]+)\s*\)\s*;(?P<comment>.*)$"
)


def text_ipl_placements(maps_root: Path):
    for path in maps_root.rglob("*.ipl"):
        in_instances = False
        for raw in path.read_text(encoding="latin1", errors="ignore").splitlines():
            line = raw.strip()
            if line.lower() == "inst":
                in_instances = True
                continue
            if in_instances and line.lower() == "end":
                in_instances = False
                continue
            if not in_instances or not line or line.startswith("#"):
                continue
            fields = [field.strip() for field in line.split(",")]
            if len(fields) < 6:
                continue
            try:
                yield int(fields[0]), float(fields[3]), float(fields[4]), float(fields[5])
            except ValueError:
                continue


def binary_ipl_placements(img_path: Path):
    with img_path.open("rb") as stream:
        header = stream.read(8)
        if header[:4] != b"VER2":
            raise RuntimeError(f"Unsupported IMG format: {img_path}")
        entry_count = struct.unpack_from("<I", header, 4)[0]
        entries = []
        for _ in range(entry_count):
            offset, size, _, name = struct.unpack("<IHH24s", stream.read(32))
            name = name.split(b"\0", 1)[0].decode("ascii", errors="ignore")
            if name.lower().endswith(".ipl"):
                entries.append((offset, size))

        for offset, size in entries:
            stream.seek(offset * 2048)
            data = stream.read(size * 2048)
            if data[:4] != b"bnry" or len(data) < 76:
                continue
            count = struct.unpack_from("<I", data, 4)[0]
            start = struct.unpack_from("<I", data, 28)[0]
            for index in range(count):
                position = start + index * 40
                if position + 40 > len(data):
                    break
                x, y, z, _, _, _, _, model, _, _ = struct.unpack_from(
                    "<7f3i", data, position
                )
                yield model, x, y, z


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--gta-root", type=Path, required=True)
    parser.add_argument("--source", type=Path, required=True)
    args = parser.parse_args()

    placements = list(text_ipl_placements(args.gta_root / "data" / "maps"))
    placements.extend(binary_ipl_placements(args.gta_root / "models" / "gta3.img"))

    output = []
    resolved = unresolved = generated = 0
    for raw in args.source.read_text(encoding="utf-8", errors="strict").splitlines():
        match = WILDCARD.match(raw)
        if not match:
            output.append(raw)
            continue
        x, y, z, radius = (
            float(match[name]) for name in ("x", "y", "z", "radius")
        )
        effective_radius = max(radius, 0.3) + 0.05
        models = sorted(
            {
                model
                for model, px, py, pz in placements
                if (px - x) ** 2 + (py - y) ** 2 + (pz - z) ** 2
                <= effective_radius**2
            }
        )
        if not models:
            output.append(raw)
            unresolved += 1
            continue
        indent = match["indent"]
        comment = match["comment"]
        for index, model in enumerate(models):
            suffix = comment if index == 0 else ""
            output.append(
                f"{indent}RemoveBuildingForPlayer(playerid, {model}, "
                f"{match['x']}, {match['y']}, {match['z']}, {match['radius']});{suffix}"
            )
        resolved += 1
        generated += len(models)

    args.source.write_text("\n".join(output) + "\n", encoding="utf-8", newline="\n")
    print(
        f"Resolved {resolved} wildcard removals into {generated} concrete calls; "
        f"left {unresolved} unmatched interior entries."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
