#!/bin/bash
#
# This lists status all service components.
#
# Just van den Broecke - 2021
#

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "Containers"
echo "=========="
docker ps

#echo "Networks"
#echo "========"
#docker network ls
#
# echo "Volumes"
# echo "======="
# docker volume ls
