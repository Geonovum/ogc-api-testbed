#!/bin/bash

source ../env.sh

RMFILES="data/api-resources data/cache data/ldproxy.log data/store data/tmp"

./stop.sh && sudo rm -rf ${RMFILES} && docker pull iide/ldproxy:latest && ./start.sh
