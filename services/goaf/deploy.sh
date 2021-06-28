#!/bin/bash

source ../env.sh


./stop.sh && docker pull pdok/wfs-3.0:latest && ./start.sh
