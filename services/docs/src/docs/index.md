---
title: Home
---

# Home

This is a placeholder for upcoming full documentation.

See the [project README on GitHub](https://github.com/Geonovum/ogc-api-testbed/blob/main/README.md)
for how this testbed is setup.

## Sandbox and stable environment
The sandbox environment is intended to play with the services: 
create and deploy an API. For example, to create and deploy an API with pygeoapi. 
Deployed services on the sandbox are not intended to be used by others for other 
purposes than testing. They could be removed or changed any time, without notice.

The stable environment is intended for demo APIs (and other services) that should be 
available for the public. For example to show results, or for third parties to use in other tests. 
Still no full production environment, or guaranteed availability. But only a few maintainers 
are able to change or remove services deployed to this environment.

## HowTos

There are several howto's, for the sandbox environment:

1. [create and deploy a base API](howto/index.md)
1. [create and deploy INSPIRE compliant API (pygeoapi)](howto/index.md)
1. [removing an API from the sandbox](howto/index.md)

Specific for administrators of the stable environment:

1. [management of the stable environment](setup/admin.md)

## Findings on installation
See [installation_findings.md](results/installation_findings.md)

## Services

These are the services running on this domain.

* [pygeoapi](/pygeoapi) is a Python implementation of OGC API. 
    * Read the [documentation](https://docs.pygeoapi.io/en/latest/). 
    * Read the [pygeoapi how to](howto/howto_pygeoapi.md)
    * Read our [deployment experiences](setup/pygeoapi.md).
* [ldproxy](/ldproxy) is a java implementation of OGC API by Interactive Instruments. 
    * Read the [documentation](https://interactive-instruments.github.io/ldproxy/). 
    * Read the [ldproxy how to](howto/howto_ldproxy.md)
    * Read our [deployment experiences](setup/ldproxy.md).
* [geoserver](/geoserver) is a java implementation of OGC API by the geoserver community.
    * Read the [documentation](https://docs.geoserver.org/latest/en/user/community/ogc-api/index.html). 
    * Read the [geoserver how to](howto/howto_geoserver.md)
    * Read our [deployment experiences](setup/geoserver.md).

### Supporting services

* PostGreSQL is a database with the PostGIS extension. You can manage and upload data via the [PGAdmin web application](/pgadmin)
* [portainer](/portainer/) is a Docker monitoring user interface to restart containers and view container logs.
* [GeoHealthCheck](/GeoHealthCheck) is an availability monitoring application which is able to run basic validations on the OGC API's. 

## Tech docs environment
See the [GitHub repo](https://github.com/Geonovum/ogc-api-testbed) for code and docs about the setup of the environment itself.

## Links

* [Project GitHub Repo](https://github.com/Geonovum/ogc-api-testbed)
* [Geonovum](https://geonovum.nl) - Geonovum home
* [pygeoapi](https://pygeoapi.io) - `pygeoapi` project home
* [ldproxy](https://github.com/interactive-instruments/ldproxy) - `ldproxy` project home
