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

    # Raw manifest
    kubectl apply -f "${CRDFILE}"

    # OR with Tanka
    #tk export ./manifests .
    #rm -f ./manifests/manifest.json
    #kubectl apply -f ./manifests

    kubectl proxy &

    sleep 120 # Waiting for /openapi/v2 reconciliation
fi

k8s-gen -o /output -c "$1"
