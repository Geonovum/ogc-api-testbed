#!/bin/bash

source ../env.sh

# Change for new service and subpath
export SERVICE_NAME="geoserver"
export SERVICE_PATH="/${SERVICE_NAME}"

# Can be usually left as-is, unless you want to run specific build and/or version.
export DOCKER_IMAGE_NAME="oscarfonts/geoserver"
export DOCKER_IMAGE_VERSION="latest"
export DOCKER_IMAGE="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}"
