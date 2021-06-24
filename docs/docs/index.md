---
title: OGC-API-Testbed Documentation
---

# OGC-API-Testbed Documentation

This documents the [Geonovum](https://geonovum.nl) OGC API Testbed Platform. Focus is on
the Platform's design/setup, how it is provisioned (bootstrapped) and its continuous deployment/integration (CI/CD).

Initially, the main goal of the Platform is to experiment with, and evaluate 
various implementations of the [OGC API Features (OAFeat) Standard](https://ogcapi.ogc.org/features/). Given the generic nature
of the Platform's web-services deployment architecture, additional services and OGC APIs may be added.
The stable version of the Platform is provided as an [Open Source GitHub Template](https://github.com/Geonovum/ogc-api-testbed), allowing any party to 
derive and customize their own.

Find a quick intro in the project [README](https://github.com/Geonovum/ogc-api-testbed#readme).

The documentation is split up as follows:

* [Setup](setup/index.md) describes the platform architecture and setup (admin manual)
* [HOWTO](howto/index.md) has a number of tutorials on how to operate the system (user manual)
* [Findings](findings/index.md) design choices, identified challenges and solutions
* [Cases](cases/index.md) contains some experiments performed on the platform, and may be extended to capture future outcomes of the testbed

## Get in Touch

[![Gitter](https://img.shields.io/gitter/room/Geonovum/ogc-api-testbed.svg?style=flat-square)](https://gitter.im/Geonovum/ogc-api-testbed)

## Services

To access and interact with the (OGC web-) services, go to 
one of the two server instances:

* Stable (production) server at [apitestbed.geonovum.nl](https://apitestbed.geonovum.nl/)
* Sandbox (experimental) server at [apisandbox.geonovum.nl](https://apisandbox.geonovum.nl/)

## Links

* [Project GitHub Repo](https://github.com/Geonovum/ogc-api-testbed)
* [Geonovum](https://geonovum.nl) - Geonovum home
* [pygeoapi](https://pygeoapi.io) - `pygeoapi` project home
* [ldproxy](https://github.com/interactive-instruments/ldproxy) - `ldproxy` project home
* [GeoServer](https://geoserver.org) - `GeoServer` home
* [OGC API Features](https://ogcapi.ogc.org/features/) - OGC Home OAFeat
