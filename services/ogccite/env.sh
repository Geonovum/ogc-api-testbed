#!/bin/bash

source ../env.sh

# Change for new service and subpath
export SERVICE_NAME="ogccite"

# Is subpath (becomes SCRIPT_NAME for Python web apps only).
export SERVICE_PATH="/${SERVICE_NAME}"

# Can be usually left as is, unless you want to run specific build and/or version.
export DOCKER_IMAGE_NAME="ogccite/ets-ogcapi-features10"
# export DOCKER_IMAGE_VERSION="latest"
export DOCKER_IMAGE_VERSION="latest"
export DOCKER_IMAGE="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}"
