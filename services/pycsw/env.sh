#!/bin/bash

source ../env.sh

# Change for new service and subpath
export SERVICE_NAME="pycsw"

# Is subpath (Python web apps only).
export SCRIPT_NAME="/${SERVICE_NAME}/csw.py"

# Can be usually left as isunless you want to run specific build and/or version.
export DOCKER_IMAGE_NAME="geopython/pycsw"
export DOCKER_IMAGE_VERSION="latest"
export DOCKER_IMAGE="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}"
