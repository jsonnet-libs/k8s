#!/usr/bin/env bash
set -euo pipefail
set -x

rm -rf "$1"
mkdir -p "$1"

for dir in libs/*; do
    [ -d "$dir" ] && make run INPUT_DIR="$dir" OUTPUT_DIR="$1"
done
