#!/usr/bin/env bash
set -euo pipefail

mkdir ~/.ssh
echo "${SSH_KEY}" > ~/.ssh/id_rsa
echo "Host github.com" > ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_rsa" >> ~/.ssh/config
ssh-keyscan github.com >> ~/.ssh/known_hosts
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
