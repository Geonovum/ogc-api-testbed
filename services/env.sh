#!/bin/bash
# Sets global env vars based on host-name
# Needed for various host-dependent configs, especiallly Traefik SSL-certs.

# Export and Defaults

# Assume a local deployment
export DEPLOY_ENV="local"
export TRAEFIK_SSL_ENDPOINT=
export TRAEFIK_SSL_DOMAIN=
export TRAEFIK_SSL_CERT_RESOLVER=
export SERVICES="traefik pygeoapi_test"

# Set host-dependent vars
case "${HOSTNAME}" in
    "OGCAPIP")
        DEPLOY_ENV="prod"
        TRAEFIK_SSL_DOMAIN="oapi.map5.nl"
        TRAEFIK_SSL_ENDPOINT="https"
        TRAEFIK_SSL_CERT_RESOLVER="default"
        ;;
    *)
        echo "Default Local Host ${HOSTNAME}"
esac
