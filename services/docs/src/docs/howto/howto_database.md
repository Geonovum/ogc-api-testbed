---
title: HOWTO Database
---

# HOWTO Database

The infrastructure has a central [PostGreSQL](https://www.postgresql.org/) database which can be used by various services.

## Managing tables

A Webbased database manager (pgAdmin) has been installed at [https://apitestbed.geonovum.nl/pgadmin](https://apitestbed.geonovum.nl/pgadmin), which can be used to verify content in tables and administed tables and users. You can also create new tables and populate it using SQL queries (generated from a local database).

## Uploading data to PostGreSQL from QGIS

The testbed database exposes its port to the web for conveniance purposes, this is not very common in production situations. This allows QGIS to directly connect to the database. And you can use the QGIS DB manager to upload data.

- Open the Data source manager to be able to add the testbed database to QGIS

| key | value |
| --- | --- |
| service | |
| host | apitestbed.geonovum.nl |
| port | 5432 |
| database | GIS |
| SSL | allow |
| user | geopost |
| pw | xxxxx |

- Open DB Manager and select the testbed database
- Click the 'Import Layer/File' button and complete the wizard

## Connecting GeoServer to the central PostGreSQL

From GeoServer admin you can create a `store` which connects to the central database. After which you can set up feature collections originating from that store. 

- On the stores page, create a `store`. Select a store of type PostGIS (not jndi). 
- Fill in the connection details:

| key | value |
| --- | --- |
| host | postgis |
| port | 5432 |
| database | gis |
| schema | public |
| user | geopost |
| pw | xxxxx |

- From the layers screen, create a new layer.
- Select the PostGreSQL store
- Select the relevant table from the database. 
- Fill in the Layer fields, at minimum calculate the bounds of the layer.
- Save and preview the layer

## Uploading data to PostGreSQL from QGIS Bridge

As part of the data publication process of QGIS Bridge, you can configure the data to be stored on PostGreSQL. Two options exist (as configuration on a server connection):

- Bridge will send the data to GeoServer. And GeoServer will insert the data in PostGres.
- Bridge will connect directly to the remote PostGreSQL and insert the data


