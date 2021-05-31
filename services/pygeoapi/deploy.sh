#!/bin/bash

source ../env.sh


./stop.sh && docker pull geopython/pygeoapi:latest && ./start.sh
