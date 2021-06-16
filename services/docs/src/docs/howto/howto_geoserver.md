---
title: HOWTO GeoServer
---

# HOWTO GeoServer

[GeoServer](https://geoserver.org) is a commonly used application server providing webservices based on OGC standards. GeoServer provides a web interface to set up new services, including extended authorisation options. 

GeoServer uses a concept of workspaces to cluster a series of collections. Each workspace in GeoServer is set up as a separate OGC API Features endpoint, e.g. https://apitestbed.geonovum.nl/geoserver/{workspace}/ogc/features, although geoserver also has an endpoint with access to all collections from all workspaces.

This document lists 2 approaches to set up OGC API Features services in GeoServer. Both approaches can not be combined in a single GeoServer instance. 

## Dynamical setup

GeoServer can be dynamically configured to add new services. 2 approaches are described:

### Via Web Administrator

This HOWTO describes how you can upload data and set up a new layer on GeoServer via the Web Administrator.

* Most easy option to upload your data is to insert it into the PostGreSQL database using [PGAdmin](/pgadmin) or QGIS DB manager.
* Log in to GeoServer
* From the Stores page, create a new store
* Select type PostGIS (not jndi), fill the connection details

| key | value |
| --- | --- |
| host | postgis |
| port | 5432 |
| database | gis |
| schema | public |
| user | geopost |
| pw | xxxxx |

* From the layers screen, create a new layer
* Select the PostGreSQL store and select the relevant table
* Fill in the various tabs (at least calculate the layer bounds)
* Test the layer via layer preview


### Via GeoCat Bridge

This HOWTO describes how you can use QGIS to setup a new layer on GeoServer. For QGIS a plugin called GeoCat Bridge is available which 
can publish a QGIS project as a workspace on GeoServer. The Bridge plugin is available via the plugins menu.

We prepared a small [video about the steps involved](https://drive.geocat.net/s/PtNWacEFfP9AN7Z). 


## Scripted setup

In a scripted setup the [data folder of GeoServer](https://github.com/Geonovum/ogc-api-testbed/tree/main/services/geoserver/data) is prepared locally and copied or mounted into the container as part of the deployment process. This setup is usefull when working with app-schema datasets ('complex GML'), which requires dedicated configuration which is not possible via the web administrator.

A helpfull tool here is [Hale](https://github.com/halestudio/hale), which has an option to export a prepared data folder for geoserver, including the pre configured app-schema configuration