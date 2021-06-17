#!/bin/bash

source ../env.sh

[[ ${DEPLOY_ENV} == "prod" ]] && [[ -z ${PG_GHC_USER} ]] && echo "EXIT: Admin creds must be set for prod server!" && exit -1
echo "Looks good! POSTGRES user is: ${PG_GHC_USER}"

./stop.sh
docker-compose up -d
