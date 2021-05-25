#!/bin/bash

source ../env.sh

./stop.sh
docker-compose build
./start.sh
