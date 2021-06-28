#!/bin/bash

source ./env.sh

# Now logging to docker console
# RMFILES="data/api-resources data/cache data/ldproxy.log data/store data/tmp"
# RMFILES="data/ldproxy.log"
# sudo rm -rf ${RMFILES} > /dev/null 2>&1

./stop.sh
docker-compose up -d
