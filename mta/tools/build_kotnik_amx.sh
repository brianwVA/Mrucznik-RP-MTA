#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Usage: PAWNCC=/path/to/release/pawncc $0 KOTNIK_SOURCE [OUTPUT_AMX]" >&2
    exit 2
fi

source_root="$(cd "$1" && pwd)"
pawncc="${PAWNCC:-}"
output="${2:-$source_root/gamemodes/Kotnik-RP.amx}"

if [[ -z "$pawncc" || ! -x "$pawncc" ]]; then
    echo "PAWNCC must point to an executable Pawn 3.10.10 Release compiler." >&2
    exit 2
fi
if [[ ! -f "$source_root/gamemodes/Kotnik-RP.pwn" ]]; then
    echo "Kotnik-RP.pwn is missing under: $source_root/gamemodes" >&2
    exit 2
fi

build_dir="$(mktemp -d "${TMPDIR:-/tmp}/kotnik-amx.XXXXXX")"
trap 'unlink "$build_dir/Kotnik-RP.amx" 2>/dev/null || true; rmdir "$build_dir" 2>/dev/null || true' EXIT

(
    cd "$source_root/gamemodes"
    "$pawncc" \
        -i../pawncc/include/ \
        -Dgamemodes \
        Kotnik-RP.pwn \
        '-;+' \
        '-(+' \
        -d2 \
        -O2 \
        '-Z+' \
        "-o$build_dir/Kotnik-RP.amx"
)

if [[ ! -s "$build_dir/Kotnik-RP.amx" ]]; then
    echo "Pawn compiler did not produce Kotnik-RP.amx." >&2
    exit 1
fi

mkdir -p "$(dirname "$output")"
cp "$build_dir/Kotnik-RP.amx" "$output"
shasum -a 256 "$output"
