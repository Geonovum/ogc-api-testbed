#!/bin/bash

source ./env.sh

[[ ${DEPLOY_ENV} == "prod" ]] && [[ -z ${PG_USER} ]] && echo "EXIT: POSTGRES and PGADMIN creds must be set for prod server!" && exit -1
echo "Looks good! POSTGRES user is: ${PG_USER}"

./stop.sh
docker-compose up -d
