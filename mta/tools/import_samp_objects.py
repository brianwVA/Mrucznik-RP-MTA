#!/usr/bin/env python3
"""Import SA-MP 0.3.7 object models into an installed MTA resource."""

from __future__ import annotations

import argparse
import re
import shutil
import struct
from pathlib import Path


SECTOR_SIZE = 2048


def read_img_directory(path: Path) -> dict[str, tuple[int, int]]:
    with path.open("rb") as handle:
        if handle.read(4) != b"VER2":
            raise ValueError(f"Unsupported IMG format: {path}")
        count = struct.unpack("<I", handle.read(4))[0]
        result: dict[str, tuple[int, int]] = {}
        for _ in range(count):
            offset, size, _stream_size, raw_name = struct.unpack("<IHH24s", handle.read(32))
            name = raw_name.split(b"\0", 1)[0].decode("ascii").lower()
            result[name] = (offset * SECTOR_SIZE, size * SECTOR_SIZE)
        return result


def extract_img_entry(img: Path, entry: tuple[int, int], output: Path) -> None:
    offset, size = entry
    with img.open("rb") as handle:
        handle.seek(offset)
        data = handle.read(size)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_bytes(data)


def read_ide(path: Path) -> list[tuple[int, str, str]]:
    models: list[tuple[int, str, str]] = []
    in_objects = False
    for raw_line in path.read_bytes().decode("cp1250", errors="strict").splitlines():
        line = raw_line.split("#", 1)[0].strip()
        if line == "objs":
            in_objects = True
            continue
        if in_objects and line == "end":
            break
        if not in_objects or not line:
            continue
        fields = [field.strip() for field in line.split(",")]
        if len(fields) >= 3 and fields[0].lstrip("-").isdigit():
            models.append((int(fields[0]), fields[1], fields[2]))
    return models


def split_col_archive(path: Path) -> dict[str, bytes]:
    directory = read_img_directory(path)
    archive_entry = directory.get("allsampcols.col")
    if not archive_entry:
        raise FileNotFoundError("AllSAMPCOLs.col not found in SAMPCOL.img")
    offset, size = archive_entry
    with path.open("rb") as handle:
        handle.seek(offset)
        data = handle.read(size)

    result: dict[str, bytes] = {}
    position = 0
    while position + 30 <= len(data):
        signature = data[position : position + 4]
        if signature not in {b"COLL", b"COL2", b"COL3", b"COL4"}:
            break
        payload_size = struct.unpack_from("<I", data, position + 4)[0]
        chunk_size = payload_size + 8
        if chunk_size <= 8 or position + chunk_size > len(data):
            break
        name = data[position + 8 : position + 30].split(b"\0", 1)[0].decode("ascii").lower()
        result[name] = data[position : position + chunk_size]
        position += chunk_size
    return result


def update_meta(meta_path: Path, files: set[str]) -> None:
    text = meta_path.read_text(encoding="utf-8")
    script_line = '  <script src="shared/samp_objects.lua" type="shared" cache="false" />'
    if "shared/samp_objects.lua" not in text:
        text, count = re.subn(
            r'(^\s*<script\s+src="shared/registry\.lua"[^>]*/>)',
            r'\1\n' + script_line,
            text,
            count=1,
            flags=re.MULTILINE,
        )
        if count != 1:
            raise ValueError("Could not insert samp_objects.lua after registry.lua")

    existing = set(re.findall(r'<file\s+src="([^"]+)"', text))
    additions = [f'    <file src="{name}" />' for name in sorted(files - existing)]
    if additions:
        text = text.replace("</meta>", "\n".join(additions) + "\n</meta>")
    meta_path.write_text(text, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--gta", type=Path, required=True)
    parser.add_argument("--resource", type=Path, required=True)
    args = parser.parse_args()

    samp = args.gta / "SAMP"
    samp_img = samp / "SAMP.img"
    samp_col_img = samp / "SAMPCOL.img"
    gta_imgs = sorted((args.gta / "models").glob("*.img"))
    for required in (samp / "SAMP.ide", samp_img, samp_col_img):
        if not required.is_file():
            raise FileNotFoundError(required)

    if not gta_imgs:
        raise FileNotFoundError(args.gta / "models/*.img")

    models = read_ide(samp / "SAMP.ide")
    samp_entries = read_img_directory(samp_img)
    all_entries: dict[str, tuple[Path, tuple[int, int]]] = {
        name: (samp_img, entry) for name, entry in samp_entries.items()
    }
    for gta_img in gta_imgs:
        for name, entry in read_img_directory(gta_img).items():
            all_entries.setdefault(name, (gta_img, entry))
    collisions = split_col_archive(samp_col_img)
    assets = args.resource / "assets" / "samp037"
    asset_meta: set[str] = set()
    definitions: list[str] = []
    imported = 0
    skipped: list[tuple[int, str, str]] = []

    for model_id, dff_name, txd_name in models:
        dff_key = f"{dff_name}.dff".lower()
        txd_key = f"{txd_name}.txd".lower()
        dff_source_entry = all_entries.get(dff_key)
        txd_source_entry = all_entries.get(txd_key)
        loose_txd = args.gta / "models" / f"{txd_name}.txd"
        if not dff_source_entry or (not txd_source_entry and not loose_txd.is_file()):
            skipped.append((model_id, dff_name, txd_name))
            continue

        dff_source, dff_entry = dff_source_entry

        dff_out = assets / f"{dff_name}.dff"
        txd_out = assets / f"{txd_name}.txd"
        if not dff_out.exists():
            extract_img_entry(dff_source, dff_entry, dff_out)
        if not txd_out.exists():
            if txd_source_entry:
                txd_source, txd_entry = txd_source_entry
                extract_img_entry(txd_source, txd_entry, txd_out)
            else:
                shutil.copyfile(loose_txd, txd_out)

        col_data = collisions.get(dff_name.lower())
        col_out = assets / f"{dff_name}.col"
        if col_data and not col_out.exists():
            col_out.write_bytes(col_data)

        dff_rel = f"assets/samp037/{dff_name}.dff"
        txd_rel = f"assets/samp037/{txd_name}.txd"
        asset_meta.update((dff_rel, txd_rel))
        col_field = ""
        if col_data:
            col_rel = f"assets/samp037/{dff_name}.col"
            asset_meta.add(col_rel)
            col_field = f', col = "{col_rel}"'
        definitions.append(
            f'    MRP_OBJECT_MODELS[{model_id}] = {{ base = 1337, dff = "{dff_rel}", txd = "{txd_rel}"{col_field} }}'
        )
        imported += 1

    registry = args.resource / "shared" / "samp_objects.lua"
    registry.parent.mkdir(parents=True, exist_ok=True)
    registry.write_text(
        "-- Generated from the locally installed SA-MP 0.3.7 model archives.\n"
        "MRP_OBJECT_MODELS = MRP_OBJECT_MODELS or {}\n"
        + "\n".join(definitions)
        + "\n",
        encoding="utf-8",
    )
    update_meta(args.resource / "meta.xml", asset_meta)
    print(f"Imported {imported} SA-MP object definitions; skipped {len(skipped)} without complete assets")
    if skipped:
        print("Skipped IDs: " + ", ".join(str(item[0]) for item in skipped[:30]))


if __name__ == "__main__":
    main()
