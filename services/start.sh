#!/bin/bash
#
# This starts all service components.
# You must first have done ./build.sh
#
# Just van den Broecke - 2021
#

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ${SCRIPT_DIR}/env.sh

# first create the Docker network
docker network create --driver bridge service-network
SERVICES="$(find ${SCRIPT_DIR} -maxdepth 1 -mindepth 1 -type d)"

for SERVICE in ${SERVICES}
do
	pushd ${SERVICE}
		./start.sh
	popd
done

${SCRIPT_DIR}/status.sh
