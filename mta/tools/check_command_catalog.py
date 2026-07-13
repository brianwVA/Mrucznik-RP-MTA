#!/usr/bin/env python3
"""Fail when the committed command catalog differs from Pawn sources."""

from __future__ import annotations

import filecmp
import subprocess
import sys
import tempfile
from pathlib import Path


def main() -> int:
    mta_dir = Path(__file__).resolve().parents[1]
    repo = mta_dir.parent
    expected = mta_dir / "compatibility"
    with tempfile.TemporaryDirectory() as directory:
        generated = Path(directory)
        subprocess.run(
            [sys.executable, str(mta_dir / "tools" / "build_command_catalog.py"), "--repo", str(repo), "--output", str(generated)],
            check=True,
        )
        for name in ("commands.json", "commands.csv"):
            if not filecmp.cmp(expected / name, generated / name, shallow=False):
                print(f"Command catalog is stale: {expected / name}", file=sys.stderr)
                return 1
    print("Command catalog matches the Pawn source")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
