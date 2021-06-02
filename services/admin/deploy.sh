#!/bin/bash

source ../env.sh

./stop.sh && docker pull portainer/portainer-ce:latest && ./start.sh
