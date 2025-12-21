#!/bin/bash

source ../env.sh

# Change for new service and subpath
export SERVICE_NAME="joins_pygeoapi"

# Is subpath (becomes SCRIPT_NAME for Python web apps only).
export SERVICE_PATH="/${SERVICE_NAME}"

export PYGEOAPI_REPO="https://github.com/GeoSander/pygeoapi"
export PYGEOAPI_BRANCH="ogc-api-joins"
export PYGEOAPI_REPO_ZIP="${PYGEOAPI_REPO}/archive/refs/heads/${PYGEOAPI_BRANCH}.zip"
