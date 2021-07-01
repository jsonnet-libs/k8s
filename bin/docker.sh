#!/usr/bin/env bash
set -euo pipefail
set -x

CI=${CI:-false}
DEBUG=${DEBUG:-false}

OPTS=""
if [ "$CI" != "true" ]; then
    # When run locally volume mounts match ownership of current user.
    OPTS="$OPTS --user $(id -u):$(id -g)"
    OPTS="$OPTS -v /etc/passwd:/etc/passwd:ro"
    OPTS="$OPTS -v /etc/group:/etc/group:ro"
fi

if [ "$DEBUG" == "true" ]; then
    # Start a shell
    OPTS="$OPTS -ti --entrypoint /bin/bash"
fi

docker run --rm $OPTS "$@"
