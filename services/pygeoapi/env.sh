#!/bin/bash

source ../env.sh

# Change for new service and subpath
export SERVICE_NAME="pygeoapi"

# Is subpath (becomes SCRIPT_NAME for Python web apps only).
export SERVICE_PATH="/${SERVICE_NAME}"

# Can be usually left as is, unless you want to run specific build and/or version.
export DOCKER_IMAGE_NAME="geopython/pygeoapi"
# export DOCKER_IMAGE_VERSION="latest"
export DOCKER_IMAGE_VERSION="dev"
export DOCKER_IMAGE="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}"

export PYGEOAPI_REPO="https://github.com/geopython/pygeoapi"
export PYGEOAPI_BRANCH="crs-features-ogc-adr"
export PYGEOAPI_REPO_ZIP="${PYGEOAPI_REPO}/archive/refs/heads/${PYGEOAPI_BRANCH}.zip"
