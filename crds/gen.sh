#!/bin/bash
set -euo pipefail
set -x

CRDS=$(yq e '.specs[]|select(has("crd"))|.crd' - < "$1")

CRDFILE=$(mktemp)
API_LOGFILE=$(mktemp)

if [ -n "$CRDS" ]; then
    ./bare-k3s >"${API_LOGFILE}" 2>&1 &
    echo "---" > "${CRDFILE}"
    for URL in ${CRDS}; do
        echo "Downloading ${URL}..."
        curl -s "${URL}" >> "${CRDFILE}"
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

k8s-gen -o /output -c "$1"
