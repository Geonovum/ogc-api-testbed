---
title: OGC-API-Testbed - pygeoapi tests
---

# OGC-API-Testbed - pygeoapi tests

This page provides some links to URLs on the API Testbed Server in order to test 
pygeoapi additions made as part of the Tender [OGC-API-Features tooling adjustments to the Dutch API Design Rules and INSPIRE](https://www.geonovum.nl/themas/invitation-to-tender).

## OGC API Features Part 2
This is basically support for the query parameters `crs` and `crs-bbox`.

### CRS BBOX

The AddressesNL is a small (100) set of INSPIRE Harmonized Addresses (AD) situated in the
North-East of The Netherlands.

Find the [Collection config](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pygeoapi/local.config.yml#L57) here. 
BBOX of the Collection is `6.85, 53.311, 6.87, 53.322` (WGS84, lon, lat axis ordering). 
 
**BBOX CRS in Dutch RD (EPSG:28992):**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=13000,400000,400000,700000&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/28992](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=13000,400000,400000,700000&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/28992)

**BBOX CRS in ETRS89 INSPIRE EPSG:4258 - note the lat, lon axis ordering:**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=53,6,54,7&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/4258](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=53,6,54,7&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/4258)

**BBOX CRS in CRS 4326 - note the lat, lon axis ordering:**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=53,6,54,7&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/4326](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=53,6,54,7&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/4326)

**BBOX CRS in CRS 4326 - note that lon, lat axis ordering gives zero Items:**
  
* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/4326](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/4326)

**BBOX CRS in "OGC WGS84" - note the lon, lat axis ordering):**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84)
* GeoJSON: [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84&f=json)

### INSPIRE Download Enclosures

**See content length added for Addresses GML Download**

* [config segment](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pygeoapi/local.config.yml#L144) and Collection Description: [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL?f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL?f=json) 
