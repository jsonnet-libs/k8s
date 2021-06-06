#!/usr/bin/env bash
set -euo pipefail
set -x

INPUT_DIR="$1"

jsonnet -c -m "${INPUT_DIR}" -J . -S "${INPUT_DIR}/config.jsonnet"

CONFIG_FILE="${INPUT_DIR}/config.yml"

REPO=$(yq2 e '.repository' - < "${CONFIG_FILE}")
CRDS=$(yq2 e '.specs[]|select(has("crds"))|.crds[]' - < "${CONFIG_FILE}")

OUTPUT_DIR="$2/${REPO}"

CRDFILE=$(mktemp)
API_LOGFILE=$(mktemp)

if [ -n "$CRDS" ]; then
    ./bare-k3s >"${API_LOGFILE}" 2>&1 &

    echo "" > "${CRDFILE}"
    for URL in ${CRDS}; do
        echo "---" >> "${CRDFILE}"
        echo "Downloading ${URL}..."
        curl -sL "${URL}" >> "${CRDFILE}"
    done

    server_up() {
        local i
        for i in $(seq 1 10); do
          local out
          if out=$(kubectl get --raw /healthz 2>/dev/null); then
            echo "On try ${i}: ${out}"
            return 0
          fi
          sleep 1
        done
    }

    if ! server_up; then
      tail -10 "${API_LOGFILE}" >&2 || :
      exit 1
    fi

    kubectl apply -f "${CRDFILE}"

    kubectl proxy &

    # Waiting for /openapi/v2 reconciliation
    # If we don't wait for this to happen, some CRDs won't show up in the
    # output, resulting in missing build artifacts on the libraries without
    # warning or error.
    # Ideally this script can verify whether all CRDs have been reconciled as
    # the time it takes might increase with more CRDs added.
    sleep 120
fi

mkdir -p "${OUTPUT_DIR}"

shopt -s dotglob
cp -r "${INPUT_DIR}/skel"/* "${OUTPUT_DIR}"

k8s-gen -o "${OUTPUT_DIR}" -c "${CONFIG_FILE}"

./docs.sh "${INPUT_DIR}" "${OUTPUT_DIR}"
