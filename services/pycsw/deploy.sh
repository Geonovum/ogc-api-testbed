#!/bin/bash

source ../env.sh

./stop.sh && docker pull geopython/pycsw:latest && ./start.sh
