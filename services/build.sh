#!/bin/bash
#
# This builds all components.
#
# Just van den Broecke - 2021
#

SCRIPT_DIR=${0%/*}

SERVICES=""

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./build.sh
	popd
done
