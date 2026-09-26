#!/usr/bin/env bash
set -euo pipefail
set -x

RUNTIME=${RUNTIME:-docker}
CI=${CI:-false}
DEBUG=${DEBUG:-false}

OPTS=""
if [ "$CI" != "true" ] && [ "$RUNTIME" != 'podman' ]; then
    # When run locally (not in podman) volume mounts match ownership of current user.
    OPTS="$OPTS --user $(id -u):$(id -g)"
    OPTS="$OPTS -v /etc/passwd:/etc/passwd:ro"
    OPTS="$OPTS -v /etc/group:/etc/group:ro"
fi

if [ "$DEBUG" == "true" ]; then
    # Start a shell
    OPTS="$OPTS -ti --entrypoint /bin/bash"
fi

$RUNTIME run --rm $OPTS "$@"
