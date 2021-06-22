#!/bin/bash
# Sets global env vars based on host-name
# Needed for various host-dependent configs, especiallly Traefik SSL-certs.

# Export and Defaults

# Assume a local deployment
export DEPLOY_ENV="local"
export TRAEFIK_SSL_ENDPOINT=
export TRAEFIK_SSL_DOMAIN="apitestbed.geonovum.nl"
export TRAEFIK_SSL_CERT_RESOLVER=
export TRAEFIK_USE_TLS="false"
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)
export HOST_UID_GID="${HOST_UID}:${HOST_GID}"

# Set host-dependent vars
case "${HOSTNAME}" in
    "OGCAPIP")
        DEPLOY_ENV="prod"
        ;;
    "apitestbed.geonovum.nl")
        DEPLOY_ENV="prod"
        ;;
    "apitestbed")
        DEPLOY_ENV="prod"
        ;;
    "vps11118.alm01.cloud")
        DEPLOY_ENV="prod"
        ;;
    *)
        echo "Default Local Host ${HOSTNAME}"
esac

if [[ ${DEPLOY_ENV} = "prod" ]]
then
	source /etc/environment
    TRAEFIK_SSL_ENDPOINT="https"
    TRAEFIK_SSL_CERT_RESOLVER="le"
    TRAEFIK_USE_TLS="true"
fi
