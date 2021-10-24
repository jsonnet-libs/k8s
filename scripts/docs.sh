#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

INPUT_DIR=$1
OUTPUT_DIR=$2

CONFIG_FILE="${INPUT_DIR}/config.yml"

DOCS="${OUTPUT_DIR}/docs"

mkdir -p "${DOCS}"

LIBS=$(yq2 e '.specs[]|.output' - < "${CONFIG_FILE}")
pushd "${OUTPUT_DIR}"
for d in ${LIBS}; do
    [ -d "$d" ] && \
        docsonnet \
        -o "docs/$d" \
        --urlPrefix "$d" \
        "$d/main.libsonnet"
done
popd
