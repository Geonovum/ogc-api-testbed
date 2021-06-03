#!/bin/bash
#
# Fix permissions for changed ownership in mounted directories
# GeoServer tends to change these permissions, causing git updates to fail.
#
# Author: Just van den Broecke
# Inspired from:
# https://stackoverflow.com/questions/26500270/understanding-user-file-ownership-in-docker-how-to-avoid-changing-permissions-o/26514736#26514736

HOST_UID=`id -u`
HOST_FOLDERS="$(pwd)/data $(pwd)/exts"

for FOLDER in ${HOST_FOLDERS}
do
  echo "Fixing folder ${FOLDER}"
  docker run --rm -it \
    --entrypoint /bin/sh \
    -e HOST_UID=${HOST_UID} \
    -v ${FOLDER}:/tmp \
    alpine:latest \
    -c 'chown -R ${HOST_UID}:${HOST_UID} /tmp/'
done
