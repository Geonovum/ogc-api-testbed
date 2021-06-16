---
title: INSPIRE findings
---

# INSPIRE findings

The INSPIRE community has described an approach to provide [INSPIRE Download services using OGC API Features](https://github.com/INSPIRE-MIF/gp-ogc-api-features/blob/master/spec/oapif-inspire-download.md). This document reviews this approach for various products used in the testbed.

Similar to Atom the 
[Main principles](https://github.com/INSPIRE-MIF/gp-ogc-api-features/blob/master/spec/oapif-inspire-download.md#71-main-principles-) of the approach indicate to set up a single api endpoint for this dataset. Both GeoServer and LDProxy offer capabilitiy to set up multiple endpoint within a single service, for pygeoapi we have to set up a new service.

## Requirements class “INSPIRE-pre-defined-data-set-download-OAPIF”

| MRCO | Aspect | pygeoapi | GeoServer | LDProxy | Comment |
| --- | --- | --- | --- | --- | --- |
| M | Supports OpenApi 3.0 | + | + | + | GeoHealthCheck found issues in GeoServer and pygeoapi | 
| M | /collections has metadata link for dataset | + | - | ? | pygeoapi is flexible for configuring any type of links |
| C | If HTML endoding, /collections has metadata link as html | + | - | ? |  |
| C | For harmonised datasets, on collection level a <link type="tag"/> should be included to feature concept dictionary | + | - | ? |  |
| R | For harmonised datasets, collectionid should match featuretype from IR | + | ? | ? | |
| M | /colections has link to license | + | - | ? |  |
| R | License information in accordance with openapi | [+](https://apitestbed.geonovum.nl/pygeoapi/openapi?f=json) | [-](https://apitestbed.geonovum.nl/geoserver/ogc/features/api?f=application%2Fvnd.oai.openapi%2Bjson%3Bversion%3D3.0) | [-](https://apitestbed.geonovum.nl/ldproxy/RCE_Landschapsatlas_WFS/api/?f=json) | OpenAPI fields info/termsOfService or info/license are mentioned |

M Mandatory, C Conditional, R Recommended, O Optional

## Requirements class INSPIRE-multilinguality

All aspects are conditional, in case the dataset is multilingual. pygeoapi landed a multiligual feature recently, other products seem to not have multilingual capabilities.

| MRCO | Aspect | pygeoapi | GeoServer | LDProxy | Comment |
| --- | --- | --- | --- | --- | --- |
| C | Support accept-language header | + | - | - | |
| R | Behaviour on no matching lang | B | B | B | Returns default language |
| C | Content language header | + | - | - | |
| R | Language support at all paths | + | - | - | |
| M | hreflang on enclosure links | + | - | - | |

M Mandatory, C Conditional, R Recommended, O Optional

## Requirements class “INSPIRE-OAPIF-GeoJSON”

| MRCO | Aspect | pygeoapi | GeoServer | LDProxy | Comment |
| --- | --- | --- | --- | --- | --- |
| R | document encoding rules to geojson | ? | ? | ? | no efforts yet |

M Mandatory, C Conditional, R Recommended, O Optional

## Requirements class “INSPIRE-bulk-download”

| MRCO | Aspect | pygeoapi | GeoServer | LDProxy | Comment |
| --- | --- | --- | --- | --- | --- |
| M | link to entire dataset | + | - | - | |
| M | link has type from inspire mediatypes | + | - | - | |
| R | link has length attribute | + | - | - | |
| R | link has title attribute | + | - | - | |

M Mandatory, C Conditional, R Recommended, O Optional

## Requirements class “INSPIRE-CRS”

| MRCO | Aspect | pygeoapi | GeoServer | LDProxy | Comment |
| --- | --- | --- | --- | --- | --- |
| R | at least 1 supported CRS from list  | + | + | + | |

M Mandatory, C Conditional, R Recommended, O Optional

