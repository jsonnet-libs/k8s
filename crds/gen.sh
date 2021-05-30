#!/bin/bash
set -euo pipefail
set -x

export KUBECONFIG=/k3s-config/kube-config.yaml
CRDS=$(yq e '.specs[]|select(has("crd"))|.crd' - < "$1")
echo $CRDS

if [ -n "$CRDS" ]; then
    ./bare-k3s &
    echo "---" > crds.yml
    for URL in ${CRDS}; do
        curl -s "${URL}" >> crds.yml
    done

    sleep 10

    # Raw manifest
    kubectl apply -f crds.yml

    # OR with Tanka
    #tk export ./manifests .
    #rm -f ./manifests/manifest.json
    #kubectl apply -f ./manifests

    kubectl proxy &
    sleep 5
fi

k8s-gen -o /output -c "$1"
