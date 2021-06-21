---
title: OGC-API-Testbed Landing Page
---

# OGC-API-Testbed Home

Landing page for this server instance. 
For full documentation see [apitestdocs.geonovum.nl](https://apitestdocs.geonovum.nl).

## Questions?

[![Gitter](https://img.shields.io/gitter/room/Geonovum/ogc-api-testbed.svg?style=flat-square)](https://gitter.im/Geonovum/ogc-api-testbed)

## Services
 
Below the (web-) services running on this domain. Click links to view and interact.

### OGC API Features

Access the interactive endpoints of [OGC API Features](https://ogcapi.ogc.org/features/) 
Open Source products running in this instance. Links to documentation and HOWTOs included:

| Endpoint | Author | Docs | HOWTO
| --- | --- | --- | --- 
| [/pygeoapi](/pygeoapi) | [GeoPython Community](https://geopython.github.io/) | [link](https://docs.pygeoapi.io/en/latest/) | [link](howto/howto_pygeoapi.md)  
| [/ldproxy](/ldproxy) | Interactive Instruments | [link](https://interactive-instruments.github.io/ldproxy/) | [link](howto/howto_ldproxy.md)  
| [/geoserver](/geoserver/ogc/features) | GeoServer Community | [link](https://docs.geoserver.org/latest/en/user/community/ogc-api/index.html) | [link](howto/howto_geoserver.md)  
| [/qgis*](/qgis/wfs3) | QGIS Community | [link](https://www.qgis.org/) | [link](howto/howto_qgis.md)  
| [/pycsw/csw.py](/pycsw/csw.py/collections/metadata:main) | [GeoPython Community](https://geopython.github.io/) | [docs](https://docs.pycsw.org/en/latest/index.html) | [HOWTO](howto/howto_pycsw.md) 


* *"QGIS" is the QGIS Server Application.*

### Storage Services

The above services serve data from local files (e.g. GeoPackage) and these storage services:

* "PostGIS" - access via <server-domain-name> port 5432 - spatial database based on PostgreSQL. 
*  Manage data with the [PGAdmin web application](/pgadmin)

### Supporting Services

These are services for administration and maintenance.

| Endpoint | What / Author | Docs | HOWTO
| --- | --- | --- | --- 
| [PGAdmin](/pgadmin) | Manage PostgreSQL Data | PGAdmin Community | [link](https://www.pgadmin.org/) | [link](howto/howto_pgadmin.md)  
| [Portainer](/portainer/) | Visual Docker Manager | Docker | [link](https://www.portainer.io/) | [link](howto/howto_portainer.md)  
| [GeoHealthCheck](/ghc) | OGC Services Monitor | [GeoPython Community](https://geopython.github.io)  | [link](https://geohealthcheck.org) | [link](howto/howto_ghc.md)  

## Links

* [Project GitHub Repo](https://github.com/Geonovum/ogc-api-testbed)
* [apitestdocs.geonovum.nl](https://apitestdocs.geonovum.nl) - all documentation
