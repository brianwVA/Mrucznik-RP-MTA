#!/usr/bin/env python3
"""Download and verify every pinned Windows plugin package and file mapping."""

from __future__ import annotations

import argparse
import hashlib
import json
import tempfile
import urllib.request
import zipfile
from pathlib import Path


def digest(path: Path) -> str:
    hasher = hashlib.sha256()
    with path.open("rb") as source:
        for block in iter(lambda: source.read(1024 * 1024), b""):
            hasher.update(block)
    return hasher.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--cache",
        type=Path,
        help="Optional directory containing packages named after plugin names",
    )
    args = parser.parse_args()

    mta = Path(__file__).resolve().parents[1]
    lock = json.loads((mta / "plugins.lock.json").read_text(encoding="utf-8"))
    with tempfile.TemporaryDirectory(prefix="mrp-plugin-lock-") as temporary:
        work = Path(temporary)
        for plugin in lock["plugins"]:
            suffix = ".zip" if plugin["archive"] == "zip" else ".dll"
            cached = args.cache / f"{plugin['name']}{suffix}" if args.cache else None
            package = work / f"{plugin['name']}{suffix}"
            if cached and cached.exists():
                package = cached
            else:
                print(f"Downloading {plugin['name']} {plugin['version']}")
                urllib.request.urlretrieve(plugin["url"], package)
            actual = digest(package)
            if actual != plugin["sha256"]:
                raise ValueError(
                    f"SHA-256 mismatch for {plugin['name']}: {actual}"
                )
            if plugin["archive"] == "zip":
                with zipfile.ZipFile(package) as archive:
                    members = set(archive.namelist())
                missing = set(plugin["files"]) - members
                if missing:
                    raise ValueError(
                        f"Missing files in {plugin['name']}: {sorted(missing)}"
                    )
            elif set(plugin["files"]) != {"."}:
                raise ValueError(f"Direct package {plugin['name']} needs '.' mapping")
    print(f"Verified {len(lock['plugins'])} pinned plugin packages")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
