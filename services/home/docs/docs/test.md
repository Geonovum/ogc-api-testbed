---
title: OGC-API-Testbed - pygeoapi tests
---

# OGC-API-Testbed - pygeoapi tests

This page provides some links to URLs on the API Testbed Server in order to test 
pygeoapi additions made as part of the Tender [OGC-API-Features tooling adjustments to the Dutch API Design Rules and INSPIRE](https://www.geonovum.nl/themas/invitation-to-tender).

## OGC API Features Part 2
This is basically support for the query parameters `crs` and `crs-bbox`.

### CRS Support

**Show list of CRSs and StorageCRS**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL?f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL?f=json)
* [related config segment](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pygeoapi/local.config.yml#L144)

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

**BBOX CRS in "OGC WGS84" - note the lon, lat axis ordering:**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84)
* GeoJSON: [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?bbox=6,53,7,54&bbox-crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84&f=json)

### CRS Support

Get Feature(s) in other CRSs.

The AddressesNL is a small (100) set of INSPIRE Harmonized Addresses (AD) situated in the
North-East of The Netherlands.

Find the [Collection config](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pygeoapi/local.config.yml#L57) here. 
BBOX of the Collection is `6.85, 53.311, 6.87, 53.322` (WGS84, lon, lat axis ordering). 

**CRS in Dutch RD (EPSG:28992):**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?crs=http://www.opengis.net/def/crs/EPSG/0/28992&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?crs=http://www.opengis.net/def/crs/EPSG/0/28992&f=json)
* [https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items?f=json&crs=http://www.opengis.net/def/crs/EPSG/0/28992](https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items?f=json&crs=http://www.opengis.net/def/crs/EPSG/0/28992)

**CRS and BBOX CRS in Dutch RD (EPSG:28992):**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?crs=http://www.opengis.net/def/crs/EPSG/0/28992&bbox=13000,400000,400000,700000&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/28992&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?crs=http://www.opengis.net/def/crs/EPSG/0/28992&bbox=13000,400000,400000,700000&bbox-crs=http://www.opengis.net/def/crs/EPSG/0/28992&f=json)

**CRS in ETRS89 INSPIRE EPSG:4258 - note the lat, lon axis ordering:**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?crs=http://www.opengis.net/def/crs/EPSG/0/4258&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?crs=http://www.opengis.net/def/crs/EPSG/0/4258&f=json)
* [https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items?f=json&crs=http://www.opengis.net/def/crs/EPSG/0/4258](https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items?f=json&crs=http://www.opengis.net/def/crs/EPSG/0/4258)

**Using GeoJSON File Backend**
 
Most Collections use the OGR Provider. Here some tests for the GeoJSON Provider which stores in lon/lat WGS84.
"Picnic Benches from BGT"

* lon, lat [https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items/G0448.8abeacd5439b757600000000a0248e85?crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items/G0448.8abeacd5439b757600000000a0248e85?crs=http://www.opengis.net/def/crs/OGC/1.3/CRS84&f=json)
* lat, lon [https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items/G0448.8abeacd5439b757600000000a0248e85?crs=http://www.opengis.net/def/crs/EPSG/0/4258&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items/G0448.8abeacd5439b757600000000a0248e85?crs=http://www.opengis.net/def/crs/EPSG/0/4258&f=json)
* lat, lon [https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items/G0448.8abeacd5439b757600000000a0248e85?crs=http://www.opengis.net/def/crs/EPSG/0/4326&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items/G0448.8abeacd5439b757600000000a0248e85?crs=http://www.opengis.net/def/crs/EPSG/0/4326&f=json)
* x,y (Dutch RD) [https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items/G0448.8abeacd5439b757600000000a0248e85?crs=http://www.opengis.net/def/crs/EPSG/0/28992&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/bgt_picnic_benches/items/G0448.8abeacd5439b757600000000a0248e85?crs=http://www.opengis.net/def/crs/EPSG/0/28992&f=json)

**CRS Unsupported with extended error info:**

* [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?crs=http://www.opengis.net/def/crs/EPSG/0/1234&f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL/items?crs=http://www.opengis.net/def/crs/EPSG/0/1234&f=json)

## INSPIRE Support

### INSPIRE Download Enclosures

**See content length added for Addresses GML Download**

* [config segment](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pygeoapi/local.config.yml#L144) and Collection Description: [https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL?f=json](https://apitestbed.geonovum.nl/pygeoapi/collections/AddressesNL?f=json) 

### (Dutch) API Design Rules Support
 
Versioned pygeoapi instance with ADR support.

* [config segment](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pygeoapi/local.config.adr.yml#L18)
* [https://apitestbed.geonovum.nl/adr_pygeoapi/v1](https://apitestbed.geonovum.nl/adr_pygeoapi/v1)
