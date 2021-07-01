#!/usr/bin/env bash
set -euo pipefail
set -x

DIRNAME="$1"

mkdir "${DIRNAME}"/ssh
echo "${SSH_KEY}" > "${DIRNAME}"/ssh/id_rsa
echo "Host github.com" > "${DIRNAME}"/ssh/config
echo "  IdentityFile ${DIRNAME}/ssh/id_rsa" >> "${DIRNAME}"/ssh/config
echo "  UserKnownHostsFile ${DIRNAME}/ssh/known_hosts" >> "${DIRNAME}"/ssh/config
cat "${DIRNAME}"/ssh/config
ssh-keyscan github.com >> "${DIRNAME}"/ssh/known_hosts
chmod 700 -R "${DIRNAME}"/ssh
chmod 600 "${DIRNAME}"/ssh/id_rsa
