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
