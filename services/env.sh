#!/bin/bash
# Sets global env vars based on host-name
# Needed for various host-dependent configs, especiallly Traefik SSL-certs.

# Export and Defaults

# Assume a local deployment
export DEPLOY_ENV="local"
export TRAEFIK_SSL_ENDPOINT=
export TRAEFIK_SSL_DOMAIN="oapi.map5.nl"
export TRAEFIK_SSL_CERT_RESOLVER=
export TRAEFIK_USE_TLS="false"

# Set host-dependent vars
case "${HOSTNAME}" in
    "OGCAPIP")
        DEPLOY_ENV="prod"
        TRAEFIK_SSL_ENDPOINT="https"
        TRAEFIK_SSL_CERT_RESOLVER="le"
        TRAEFIK_USE_TLS="true"
        ;;
    *)
        echo "Default Local Host ${HOSTNAME}"
esac
