#!/bin/bash

source ../env.sh

# To prevent permission problems...for now
chmod 777 data

./stop.sh
docker-compose up -d
