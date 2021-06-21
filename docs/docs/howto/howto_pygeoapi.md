---
title: HOWTO pygeoapi
---


# HOWTO pygeoapi

The pygeoapi config is the place to start when configuring a new service. The file starts with some general server configuration and then presents a list of collections. Each collection has a data store configuration referencing one of the available data backends. A common data provider is the OGR/GDAL provider which gives access to a multitude of file formats.

In a minimal approach you can update the [current config file](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pygeoapi/local.config.yml) and add a new layer to it. 

Alternatively you can create a new instance by duplicating the [main pygeoapi service folder](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pygeoapi) under a new name and update [the main ansible orchestration](https://github.com/Geonovum/ogc-api-testbed/blob/main/ansible/deploy.yml) to add the new service. Also you have to create a new file in https://github.com/Geonovum/ogc-api-testbed/tree/main/.github/workflows, having the new name. This tells github to (re)deploy the service when changes are detected. Note that INSPIRE mandates that each dataset is exposed via a unique service endpoint and pygeoapi can only provide a single service endpoint. Duplicating the deployment is then a usual approach.

## Example of a pygeoapi collection

```YAML
lakes:                                                      # name of the collection, e.g. /collection/lakes/items
        type: collection 
        title:                                              # title, keywords and description support multilingual
            en: Large Lakes
            nl: Grote meren                               
        description: lakes of the world, public domain
        keywords:
            - lakes
        crs:                                                # CRS-es supported by backend
            - CRS84
        links:                                              # list of links to more info, for example metadata
            - type: text/html
              rel: canonical
              title: information
              href: http://www.naturalearthdata.com/
              hreflang: en-US
        extents:                                            # spatial and temporal extent of the layer
            spatial:
                bbox: [-180,-90,180,90]
                crs: http://www.opengis.net/def/crs/OGC/1.3/CRS84
            temporal:
                begin: 2011-11-11
                end: null  # or empty
        providers:                                          # list of backends
            - type: feature                                 # service type (e.g. features, maps, styles, records, coverages)
              name: GeoJSON                                 # type of provider (see docs for available types)
              data: tests/data/ne_110m_lakes.geojson        # link to a file (or other provider specific configuration)
              id_field: id                                  # field which contains the identifier
              title_field: name                             # field which contains the title of the element (can be multilingual)
```
