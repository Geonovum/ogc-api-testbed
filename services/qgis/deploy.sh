#!/bin/bash

source ../env.sh


./stop.sh && docker pull camptocamp/qgis-server:latest && ./start.sh
