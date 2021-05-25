#!/bin/bash
#
# This stops all service components.
#
# Just van den Broecke - 2021
#

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ${SCRIPT_DIR}/env.sh

SERVICES="$(find ${SCRIPT_DIR} -maxdepth 1 -mindepth 1 -type d)"

for SERVICE in ${SERVICES}
do
	pushd ${SERVICE}
		./stop.sh
	popd
done

# last remove the Docker network
# docker network rm service-network

${SCRIPT_DIR}/status.sh
