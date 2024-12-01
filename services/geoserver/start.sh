#!/bin/bash

source ./env.sh

./stop.sh
# do not start GeoServer
exit 0
docker compose up -d
