#!/bin/bash

source ../env.sh

[[ ${DEPLOY_ENV} == "prod" ]] && [[ -z ${GHC_PG_USER} ]] && echo "EXIT: Admin creds must be set for prod server!" && exit -1
echo "Looks good! POSTGRES user is: ${GHC_PG_USER}"

./stop.sh
docker-compose up -d
