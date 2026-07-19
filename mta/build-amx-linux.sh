#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/vendor/mta-amx/amx-deps/src"
OUTPUT_DIR="${1:-$SCRIPT_DIR/artifacts/amx-linux-x86}"
PREMAKE_URL="https://github.com/premake/premake-core/releases/download/v5.0.0-beta8/premake-5.0.0-beta8-linux.tar.gz"
PREMAKE_SHA256="63edd3e7461eebdd45b500a3c7e8ad4e7a67d68f230010f9a97cbb71b4ec59c8"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Brak źródeł modułu MTA AMX: $SOURCE_DIR" >&2
    exit 1
fi

WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT
mkdir -p "$WORK_DIR/src" "$OUTPUT_DIR"
cp -a "$SOURCE_DIR/." "$WORK_DIR/src/"

curl --fail --location --silent --show-error \
    --connect-timeout 30 --max-time 300 \
    --output "$WORK_DIR/premake.tar.gz" "$PREMAKE_URL"
echo "$PREMAKE_SHA256  $WORK_DIR/premake.tar.gz" | sha256sum --check --status
tar -xzf "$WORK_DIR/premake.tar.gz" -C "$WORK_DIR"
chmod 0755 "$WORK_DIR/premake5"

(
    cd "$WORK_DIR/src"
    "$WORK_DIR/premake5" --file=premake5.lua gmake2
    make -C Build config=release_x86 -j"$(nproc)"
)

KING_SO="$(find "$WORK_DIR/src" -type f \( -name king.so -o -name libking.so \) -print -quit)"
if [[ -z "$KING_SO" ]]; then
    echo "Build nie utworzył king.so." >&2
    exit 1
fi

install -m 0755 "$KING_SO" "$OUTPUT_DIR/king.so"
file "$OUTPUT_DIR/king.so"
sha256sum "$OUTPUT_DIR/king.so"
