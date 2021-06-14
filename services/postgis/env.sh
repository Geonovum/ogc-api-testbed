#!/bin/bash

source ../env.sh

export PG_PORT_HOST=5432

[[ ${DEPLOY_ENV} == local ]] && PG_PORT_HOST=5433
