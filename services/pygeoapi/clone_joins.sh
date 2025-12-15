#!/bin/bash
#
# Prepare script for GitHub-based pygeoapi OGC API - Joins service

source ./env.sh

[[ -z ${PYGEOAPI_JOINS_REPO} ]] && echo "PYGEOAPI_JOINS_REPO var not set - exit" && exit 1
[[ -z ${PYGEOAPI_JOINS_BRANCH} ]] && echo "PYGEOAPI_JOINS_BRANCH var not set - exit" && exit 1

PYGEOAPI_DIR="pygeoapi-${PYGEOAPI_JOINS_BRANCH}"

echo "Preparing pygeoapi from GitHub branch: ${PYGEOAPI_JOINS_BRANCH}"

# Clean up existing directory
/bin/rm -rf ${PYGEOAPI_DIR} > /dev/null 2>&1

# Clone the repository
git clone --depth 1 --branch ${PYGEOAPI_JOINS_BRANCH} ${PYGEOAPI_JOINS_REPO} ${PYGEOAPI_DIR}

if [ $? -eq 0 ]; then
    echo "Successfully cloned ${PYGEOAPI_JOINS_REPO} branch ${PYGEOAPI_JOINS_BRANCH}"
else
    echo "Failed to clone repository"
    exit 1
fi

echo "Preparation complete. Ready for docker-compose build."
