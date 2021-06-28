#!/bin/bash

source ./env.sh


./stop.sh && docker pull ${DOCKER_IMAGE} && ./start.sh
