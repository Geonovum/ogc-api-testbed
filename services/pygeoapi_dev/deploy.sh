#!/bin/bash

source ./env.sh

# For dev version we build Docker Image locally from repo branch
./build.sh && ./stop.sh && ../clean.sh

# Call Docker compose
./start.sh
