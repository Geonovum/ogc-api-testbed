#!/bin/bash
#
# Build script for branch version of pygeoapi Docker Image

source ./env.sh

[[ -z ${PYGEOAPI_BRANCH} ]] && echo "PYGEOAPI_BRANCH var not set - exit" && exit 1

PYGEOAPI_DIR="pygeoapi-${PYGEOAPI_BRANCH}"

/bin/rm ${PYGEOAPI_BRANCH}.zip > /dev/null 2>&1
/bin/rm -rf ${PYGEOAPI_DIR} > /dev/null 2>&1

wget ${PYGEOAPI_REPO_ZIP}
unzip ${PYGEOAPI_BRANCH}.zip

pushd ${PYGEOAPI_DIR} || exit 1
  docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION} .
popd || exit 1
