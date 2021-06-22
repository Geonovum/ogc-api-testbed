#!/bin/bash

source ../env.sh

[[ ${DEPLOY_ENV} == "prod" ]] && [[ -z ${GHC_ADMIN_USER_NAME} ]] && echo "EXIT: Admin creds must be set for prod server!" && exit -1
echo "Looks good! GHC_ADMIN_USER_NAME user is: ${GHC_ADMIN_USER_NAME}"

./stop.sh
docker-compose up -d
