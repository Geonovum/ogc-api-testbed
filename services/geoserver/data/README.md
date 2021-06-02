Default Data Directory
======================

A default empty GeoServer OGC API Experiment GeoNovum data directory.

This data directory requires provides default configuration for:

* csw
* wcs
* wds
* wms and wmts
* wps
* control-flow

Several folders are created and populated as needed by GeoServer:

* data
* gwc
* logs
* security
* styles

FAQ
---

Q: How to update GeoServer data directory contents?

Updates to GeoServer data directory occur very infrequently, with new settings and configuration options being the most common change.

Updates are performed automatically by GeoServer during application startup.

For additional guidance please see:

* https://www.geonovum.nl/docs/geoserver-enterprise/
* https://my.geonovum.nl/knowledgebase/130/GeoServer-Enterprise

Q: Where to storing large data files?

The GeoServer Data Directory is easy to access with the Browse button setting up a new Data Store or Coverage Store.
The REST API and Importer will create a folder `data` when content is uploaded.

When working with large files we recommend choosing a high performance file system and managing this information
outside of the data directory (allowing backups of application configuration to be smaller and more easily managed).