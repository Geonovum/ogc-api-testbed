#!/bin/bash

source ../env.sh

./stop.sh && docker pull iide/ldproxy:latest && ./start.sh
