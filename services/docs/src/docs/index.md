---
title: Home
---

# Home

Placeholder for upcoming full documentation.

See the [Project README on GitHub](https://github.com/Geonovum/ogc-api-testbed/blob/main/README.md)
for how this testbed is setup.

## Get in Touch

[![Gitter](https://img.shields.io/gitter/room/Geonovum/ogc-api-testbed.svg?style=flat-square)](https://gitter.im/Geonovum/ogc-api-testbed)

## Sandbox and Stable Environment
The **Sandbox environment** (URL TBS) is intended to play with the services: 
create and deploy an API. For example, to create and deploy an API with pygeoapi. 
Deployed services on the sandbox server are not intended to be used by others for other 
purposes than testing. They could be removed or changed any time, without notice.

The **Stable environment** is accessible via [https://apitestbed.geonovum.nl](https://apitestbed.geonovum.nl) and 
intended to demo APIs (and other services) that should be 
available for the public. For example to show results, or for third parties to use in other tests. 
Still no full production environment, or guaranteed availability. A few maintainers 
are able to change or remove services deployed to this environment.

## Services
 
Below the (web-) services running on this domain. Click links to view and interact.

### OGC API Features

Interactive endpoints of [OGC API Features](https://ogcapi.ogc.org/features/) Open Source products.

* [/pygeoapi](/pygeoapi) - Python implementation by the GeoPython community
    * Read the [documentation](https://docs.pygeoapi.io/en/latest/). 
    * Read the [pygeoapi how to](howto/howto_pygeoapi.md)
    * Read our [deployment experiences](setup/pygeoapi.md).
* [/ldproxy](/ldproxy) - Java implementation by Interactive Instruments. 
    * Read the [documentation](https://interactive-instruments.github.io/ldproxy/). 
    * Read the [ldproxy how to](howto/howto_ldproxy.md)
    * Read our [deployment experiences](setup/ldproxy.md).
* [/geoserver](/geoserver/ogc/features) Java implementation by the GeoServer community.
    * Read the [documentation](https://docs.geoserver.org/latest/en/user/community/ogc-api/index.html). 
    * Read the [geoserver how to](howto/howto_geoserver.md)
    * Read our [deployment experiences](setup/geoserver.md).

### Storage Services

The above services serve data from local files (e.g. GeoPackage) and these storage services:

* "PostGIS" - access via <server-domain-name> port 5432 - spatial database based on PostgreSQL. 
*  Manage data with the [PGAdmin web application](/pgadmin)

### Supporting Services

These are services for administration and maintenance.

* [PGAdmin web application](/pgadmin) - Manage data in the PostGIS DB. 
* [Portainer](/portainer/) - Docker monitoring user interface, in particular to view container logs.
* [GeoHealthCheck](/GeoHealthCheck) QoS and availability monitoring application - basic validations for OGC APIs. **TODO**

## HOWTOs

There are several HOWTOs, for the sandbox environment:

1. [create and deploy a base API](howto/index.md)
1. [create and deploy INSPIRE compliant API (pygeoapi)](howto/index.md)
1. [removing an API from the sandbox](howto/index.md)

Specific for administrators of the stable environment:

1. [management of the stable environment](setup/admin.md)

## Findings on installation
See [installation_findings.md](results/installation_findings.md)


## Tech docs environment

See the [Setup Documents](setup/index.md) for code and docs about the setup of the testbeds.

## Links

* [Project GitHub Repo](https://github.com/Geonovum/ogc-api-testbed)
* [Geonovum](https://geonovum.nl) - Geonovum home
* [pygeoapi](https://pygeoapi.io) - `pygeoapi` project home
* [ldproxy](https://github.com/interactive-instruments/ldproxy) - `ldproxy` project home
* [OGC API Features](https://ogcapi.ogc.org/features/) - OGC Home OAFeat
