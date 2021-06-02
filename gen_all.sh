#!/usr/bin/env bash
set -euo pipefail
set -x

rm -rf gen./
mkdir -p gen/

for dir in libs/*; do
    [ -d "$dir" ] && make run INPUT_DIR="$dir" OUTPUT_DIR=gen/
done
