#!/bin/bash

source ../env.sh

# Finally run. optionally create protected acme.json
export HTTP_PORT_HOST=80
export CERT_EMAIL="${EMAIL:-nospam@map5.nl}"

[[ ${DEPLOY_ENV} == local ]] && HTTP_PORT_HOST=8000
