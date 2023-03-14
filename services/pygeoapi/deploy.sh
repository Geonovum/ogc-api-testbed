#!/bin/bash

source ./env.sh

if [[ ${DOCKER_IMAGE_VERSION} == "dev" ]]
then
  # For "dev" version we build Docker Image locally from repo branch
  ./build.sh && ./stop.sh && ../clean.sh
else
  # All other cases use standard "latest" Docker Image
  ./stop.sh && ../clean.sh && docker pull ${DOCKER_IMAGE}
fi

./start.sh
