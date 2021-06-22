---
title: GeoHealthCheck
---

[GeoHealthCheck](https://geohealthcheck.org/) (GHC) is an 
availability and Quality-of-Service (QoS) monitoring solution 
dedicated to OGC (web-) services. GHC supports both the 
standard protocols like WMS, WFS, WMTS, CSW etc, APIs in general and 
the recent OAFeat OGC standard. To learn more, best is to 
follow a [GHC presentation as HTML slides or video](https://geohealthcheck.org/).

## OAFeat Support
GHC supports the
OGC OAFeat standard with two basic checks (called "Probes"):

- OAFeat endpoint traversal, check if all required resources/links are available
- full OAS schema validation

## Deployment

GHC is part of the
[Admin Stack](https://github.com/Geonovum/ogc-api-testbed/tree/main/services/admin) in the testbed.

GeoHealthCheck has Docker Images available at 
[DockerHub](https://hub.docker.com/r/geopython/geohealthcheck) 
and uses a standard PostgreSQL/PostGIS database for persistence.

GHC runs with three Docker containers:

* GHC Web Application (`ghc_web`)
* GHC Runner (runs the actual checks) (`ghc_runner`)
* GHC Postgres database stores check config and results (`ghc_db`)

## Configuration

GHC needs quite some variables (around 31, though many defaults apply). 
These are all configured once in
[ghc.env](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/admin/ghc.env). 
Many variables represent credentials like email and 
database configuration. These are bundled as `etc_environment` 
in and forwarded from the encrypted Ansible file `vars.yml`.

```
    - name: "admin"
      shell: "cd {{ services_home }}/admin && ./deploy.sh && docker ps"
      tags: admin

```

## Links
* [docker-compose.yml](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/admin/docker-compose.yml) - the Docker Compose file
