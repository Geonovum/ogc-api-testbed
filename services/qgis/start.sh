#!/bin/bash

source ./env.sh

# To prevent permission problems...for now
sudo chmod 777 data
sudo chmod 777 data/*

./stop.sh
docker-compose up -d
