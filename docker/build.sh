#! /bin/bash

# This file is only here to ease testing/development. The commands in this
# file should ultimately be moved to the corresponding commands for Cloud Build
# in the cloudbuild.*.yaml files

type -p podman > /dev/null && docker=podman || docker=docker

cd $(dirname $0)/..

for stage in graph-node-build graph-node graph-node-debug
do
    $docker build -t $stage --target $stage -f docker/Dockerfile .
done
