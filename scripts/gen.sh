#!/usr/bin/env bash
set -euo pipefail
set -x

DIRNAME=$(realpath "$(dirname "$0")")

INPUT_DIR="$1"

jsonnet -c -m "${INPUT_DIR}" -J . -S "${INPUT_DIR}/config.jsonnet"

CONFIG_FILE="${INPUT_DIR}/config.yml"

REPO=$(yq2 e '.repository' - < "${CONFIG_FILE}")
CRDS=$(yq2 e '.specs[]|select(has("crds"))|.crds[]' - < "${CONFIG_FILE}")

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

shopt -s dotglob
cp -r "${INPUT_DIR}/skel"/* "${OUTPUT_DIR}"

k8s-gen -o "${OUTPUT_DIR}" -c "${CONFIG_FILE}"

./docs.sh "${INPUT_DIR}" "${OUTPUT_DIR}"


if [ "${GEN_COMMIT}" != "true" ]; then
    ls -lah "${OUTPUT_DIR}"
else
    pushd "${OUTPUT_DIR}"
    git add .
    git commit -m "update: source github.com/jsonnet-libs/k8s@${GITHUB_SHA:0:8}"
    git push
    popd
fi
