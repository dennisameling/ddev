#!/bin/bash

# Runs "make test" in each container directory

set -eu -o pipefail
for dir in containers/*/
    do pushd $dir
    echo "--- Build container $dir"
    time make container DOCKER_ARGS=--no-cache
    echo "--- Test container $dir"
    time make test
    popd
done
set +eu
