#!/usr/bin/env bash
set -euo pipefail

DIRNAME=$(realpath "$(dirname "$0")")

INPUT_DIR="$1"

jsonnet -c -m "${INPUT_DIR}" -J . -S "${INPUT_DIR}/config.jsonnet"

CONFIG_FILE="${INPUT_DIR}/config.yml"

REPO=$(yq2 e '.repository' - < "${CONFIG_FILE}")

OUTPUT_DIR="$2/${REPO}"

if [ "${GEN_COMMIT}" != "true" ]; then
    mkdir -p "${OUTPUT_DIR}"
else
    ./configure_github_ssh.sh "${DIRNAME}"
    export GIT_SSH_COMMAND="ssh -F '${DIRNAME}/ssh/config'"
    git clone --depth 1 "ssh://git@${REPO}" "${OUTPUT_DIR}"

    git config --global user.name "${GIT_COMMITTER_NAME}"
    git config --global user.email "${GIT_COMMITTER_EMAIL}"

    # Create the gh-pages branch if it doesn't exist.
    pushd "${OUTPUT_DIR}"
    set +eo pipefail
    git push origin gh-pages || (git branch -c gh-pages && git push origin gh-pages)
    set -eo pipefail
    popd
fi

# Remove everything except .git
find "${OUTPUT_DIR}" \
    -not -path "${OUTPUT_DIR}" \
    -not -path "${OUTPUT_DIR}/.git/*" \
    -not -name '.git' \
    -delete

#BIND_PORT=6443
#
#SPECS=$(yq2 e '.specs[]|.output' - < "${CONFIG_FILE}")
#for SPEC in ${SPECS}; do
#    CRDS=$(yq2 e '.specs[]|select(.output=="'${SPEC}'")|.crds[]' - < "${CONFIG_FILE}")
#    PROXY_PORT=$(yq2 e '.specs[]|select(.output=="'${SPEC}'")|.proxy_port' - < "${CONFIG_FILE}")
#    OPENAPI=$(yq2 e '.specs[]|select(.output=="'${SPEC}'")|.openapi' - < "${CONFIG_FILE}")
#    if [ -n "$CRDS" ]; then
#        KUBECONFIG=$(mktemp)
#        API_LOGFILE=$(mktemp)
#        CRDFILE=$(mktemp)
#        ./bare-k3s ${BIND_PORT} >"${API_LOGFILE}" 2>&1 &
#
#        echo "" > "${CRDFILE}"
#        for URL in ${CRDS}; do
#            echo "---" >> "${CRDFILE}"
#            echo "Downloading ${URL}..."
#            curl -sL "${URL}" >> "${CRDFILE}"
#        done
#
#        server_up() {
#            local i
#            for i in $(seq 1 10); do
#            local out
#            if out=$(kubectl get --raw /healthz 2>/dev/null); then
#                echo "On try ${i}: ${out}"
#                return 0
#            fi
#            sleep 1
#            done
#        }
#
#        if ! server_up; then
#        tail -10 "${API_LOGFILE}" >&2 || :
#        exit 1
#        fi
#
#        # Only apply CRDs, some projects don't publish CRDs independent but as part of an "install bundle"
#        cat ${CRDFILE} \
#          | yq2 e 'select(.kind == "CustomResourceDefinition")' - \
#          | kubectl apply --server-side -f -
#
#        kubectl proxy --port=${PROXY_PORT} &
#
#        # Waiting for /openapi/v2 reconciliation
#        echo "waiting for openapi reconciliation..."
#        sleep 5
#        EXPECTED_RESOURCES=($(cat ${CRDFILE} | yq2 e '.spec.group + "/[a-zA-Z0-9]*/" + .spec.names.plural' -N -))
#        for i in $(seq 1 20); do
#            echo "checking..."
#            SCHEMA="$(curl -s ${OPENAPI})"
#            DONE="true"
#            for RESOURCE in ${EXPECTED_RESOURCES[*]}; do
#                if ! echo "${SCHEMA}" | grep -e ${RESOURCE} &> /dev/null; then
#                    echo "${RESOURCE} is not reconciliated yet..."
#                    DONE="false"
#                    break
#                fi
#            done
#            if [ "${DONE}" = "true" ]; then
#                echo "all resources were accounted for "
#                break
#            fi
#            sleep 5
#        done
#        if [ "${DONE}" != "true" ]; then
#            echo "resources were never reconciliated in the openapi specs"
#            exit 1
#        fi
#
#        BIND_PORT=$((BIND_PORT+100))
#    fi
#done


shopt -s dotglob
cp -r "${INPUT_DIR}/skel"/* "${OUTPUT_DIR}"

k8s-gen -o "${OUTPUT_DIR}" -c "${CONFIG_FILE}"

./docs.sh "${INPUT_DIR}" "${OUTPUT_DIR}"


if [ "${GEN_COMMIT}" != "true" ]; then
    ls -lah "${OUTPUT_DIR}"
else
    pushd "${OUTPUT_DIR}"
    if ! git diff --exit-code -s; then
        git add .
        git commit -m "update: source github.com/jsonnet-libs/k8s@${GITHUB_SHA:0:8}"
        git push
    else
        echo "Nothing to commit."
    fi
    popd
fi


if [ "${DIFF:-false}" == "true" ]; then
    echo "Diffing..."
    DIFF_DIR="${TMPDIR:-/tmp/}${REPO}"
    # HTTPS should always be usable without creds
    git clone --depth 1 "https://${REPO}" "${DIFF_DIR}" || echo "error cloning the repository!"

    (diff -r --exclude .git "${DIFF_DIR}" "${OUTPUT_DIR}" && echo "No diff!") || echo "There's a diff!"
fi
