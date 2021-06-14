#!/bin/bash

source ../env.sh

[[ ${DEPLOY_ENV} == "prod" ]] && [[ -z ${POSTGRES_USER} ]] && echo "EXIT: POSTGRES and PGADMIN creds must be set for prod server!" && exit -1
echo "The POSTGRES user is: ${POSTGRES_USER}"

./stop.sh
docker-compose up -d
