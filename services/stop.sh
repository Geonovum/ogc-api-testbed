#!/bin/bash
#
# This stops all service components for geoqos stack
#
# Just van den Broecke - 2021
#

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

SERVICES=""

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./stop.sh
	popd
done

# last remove the Docker network
# docker network rm service-network

${SCRIPT_DIR}/status.sh
