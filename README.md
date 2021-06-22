[![Traefik Deploy](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.traefik.yml/badge.svg)](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.traefik.yml)
[![pygeoapi Deploy](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.pygeoapi.yml/badge.svg)](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.pygeoapi.yml)
[![ldproxy Deploy](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.ldproxy.yml/badge.svg)](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.ldproxy.yml)
[![geoserver Deploy](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.geoserver.yml/badge.svg)](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.geoserver.yml)
[![postgis Deploy](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.postgis.yml/badge.svg)](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.postgis.yml)
[![admin Deploy](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.admin.yml/badge.svg)](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.admin.yml)
[![home Deploy](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.home.yml/badge.svg)](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.home.yml)
[![docs Deploy](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.docs.yml/badge.svg)](https://github.com/Geonovum/ogc-api-testbed/actions/workflows/deploy.docs.yml)
[![Gitter](https://img.shields.io/gitter/room/Geonovum/ogc-api-testbed.svg?style=flat-square)](https://gitter.im/Geonovum/ogc-api-testbed)

# OGC API Testbed
Bootstrap and continuous integration/deployment (CI/CD) for OGC API web-service components.
See the [website apitestdocs.geonovum.nl](https://apitestdocs.geonovum.nl) for docmentation and details.

Want to access the (OGC) web-services? Go to:

* Stable (production) server at [apitestbed.geonovum.nl](https://apitestbed.geonovum.nl/)
* Sandbox (experimental) server at [apisandbox.geonovum.nl](https://apisandbox.geonovum.nl/) (TODO)

## Summary

This repo contains all that is needed to bootstrap, configure and maintain (CI/CD) a remote
deployment of an OGC API web-service stack using modern "DevOps" tooling.

The main design principles are:

* any action on the server/VM host is performed from a client host
* i.e. no direct access/login to/on the server/VM is required, only maybe for problem solving
* remote actions can be performed manually or triggered by GitHub Workflows
* all credentials (passwords, SSH-keys, etc) are secured 
* operational stack instances for "production" (stable) and "sandbox" (playground)

The (DevOps-) components used in this setup are:

* [Docker](https://www.docker.com/) *"...OS-level virtualization to deliver software in packages called containers..."* ([Wikipedia](https://en.wikipedia.org/wiki/Docker_(software)))
* [Docker Compose](https://docs.docker.com/compose) *"...a tool for defining and running multi-container Docker applications..."*
* [Ansible](https://www.ansible.com/) *"...an open-source software provisioning tool"* ([Wikipedia](https://en.wikipedia.org/wiki/Ansible_(software)))
* [GitHub Actions/Workflows](https://docs.github.com/en/actions) *"...Automate, customize, and execute software development workflows in a GitHub repository..."*

The Docker-components are used to run the operational stack, i.e. the OGC API web-services. 
Ansible is used to provision both the server OS-software
and the operational stack. 
Ansible is executed on a local client/desktop system to invoke operations on a remote server/VM.
These operations are bundled in so called Ansible Playbooks, YAML files that describe a desired server state.
GitHub Actions are used to construct Workflows. 
These Actions invoke these Ansible Playbooks, effectively configuring
and provisioning the operational stack on a remote server/VM. 
GitHub Actions are triggered (selectively) on commit/push to this repo.
                    
Security is enforced by the use of [Ansible-Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html) 
and [GitHub Encrypted Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets).

The operational stack has the following components:

* [Traefik](https://traefik.io/) a frontend proxy/load-balancer and SSL (HTTPS) endpoint.
* [pygeoapi](https://pygeoapi.io/) a Python server implementation of the OGC API suite of standards.
* [GeoServer](http://geoserver.org/) a Java server implementation of the OGC API suite of standards.
* [ldproxy](https://interactive-instruments.github.io/ldproxy/) a Java server implementation of the OGC API suite of standards.
* [QGIS Server](https://www.qgis.org/) - server component of QGIS with OGC OAFeat support.
* [PostgreSQL/PostGIS](https://postgis.net) - geospatial database

For administration, documentation and monitoring the following components are used:

* [mkdocs](https://www.mkdocs.org/) for live documentation and landing pages
* [PGAdmin](https://www.pgadmin.org/) - visual PostgreSQL manager  
* [GeoHealthCheck](https://geohealthcheck.org) to monitor the availability, compliance and QoS of OGC web services
* [Portainer](https://www.portainer.io/) visual Docker monitor and manager

Read more on the setup in the [documentation/website of this project](https://apitestdocs.geonovum.nl/setup).
