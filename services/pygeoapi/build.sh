#!/bin/bash
#
# Build script for branch version of pygeoapi Docker Image

source ./env.sh

[[ -z ${PYGEOAPI_BRANCH} ]] && echo "PYGEOAPI_BRANCH var not set - exit" && exit 1

/bin/rm ${PYGEOAPI_BRANCH}.zip > /dev/null 2>&1
/bin/rm -rf ${PYGEOAPI_BRANCH} > /dev/null 2>&1

wget ${PYGEOAPI_REPO_ZIP}
unzip -d ${PYGEOAPI_BRANCH} ${PYGEOAPI_BRANCH}.zip
cd ${PYGEOAPI_BRANCH} || exit

export DOCKER_IMAGE_VERSION="dev"

docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION} .
