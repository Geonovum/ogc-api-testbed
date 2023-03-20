#!/bin/bash

source ./env.sh

./stop.sh
docker-compose up -d
