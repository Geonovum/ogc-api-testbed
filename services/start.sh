#!/bin/bash
#
# This starts all service components for geoqos stack
# You must first have done ./build.sh
#
# Just van den Broecke - 2021
#

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# first create the Docker network
docker network create --driver bridge service-network

SERVICES=""

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./start.sh
	popd
done

${SCRIPT_DIR}/status.sh
