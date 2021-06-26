---
title: pygeoapi setup
---

# pygeoapi installation experiences/hints

pygeoapi is a python implementation of the OGC API Suite of standards.

## Installation

A docker hub image is provided by [geopython](https://hub.docker.com/r/geopython/pygeoapi). 
The data folder and the main config file are mounted into the container.

The data folder contains the datafiles, alternatively you can upload data to the PostGreSQL database and configure a layer on data from the database.

The configuration file contains references to the collections which are exposed via the OGC API's. 
Check [the documentation](https://docs.pygeoapi.io/en/latest/data-publishing/index.html#providers-overview) to know which backends are supported.

You need to set up an instance of pygeoapi for each series of collections you want to serve on an endpoint.

## BRT background tiles

To find out if BRT background tiles hosted by PDOK can be used, we configured this service to have a map background of WMTS tiles hosted by PDOK. BRT is hosted in epsg:28992 and epsg:3857, the latter is a requirement. Configuration is set up as:

```
    map:
        url: https://service.pdok.nl/brt/achtergrondkaart/wmts/v2_0/standaard/EPSG:3857/{z}/{x}/{y}.png
        attribution: 'Map data &copy; <a href="https://pdok.nl">PDOK Kadaster</a>'
```

## INSPIRE

We used this installation of pygeoapi to research the INSPIRE use case. Adding several types of links as suggested by INSPIRE is doable in pygeoapi. The software doesn't help much, but also doesn't limit you in the type of links you want to add, our configuration is:

```
        links:
            - type: text/html
              rel: describedby
              title: Metadata as HTML
              href: https://www.nationaalgeoregister.nl/geonetwork/srv/metadata/45eaae76-874a-4fe1-88f4-820517e3de73
              hreflang: nl
            - type: application/xml
              rel: describedby
              title: Metadata as iso19139 xml
              href: https://www.nationaalgeoregister.nl/geonetwork/srv/metadata/45eaae76-874a-4fe1-88f4-820517e3de73/formatters/xml
              hreflang: nl
            - type: text/html
              rel: tag
              title: Referentie naar het concept beschermde gebieden (inspire registry)
              href: http://inspire.ec.europa.eu/featureconcept/ProtectedSite
              hreflang: nl
            - type: application/gml+xml
              rel: enclosure
              title: Download volledige dataset Werelderfgoed als GML
              href: https://service.pdok.nl/rce/ps-ch/wfs/v1_0?request=GetFeature&service=WFS&version=1.1.0&typeName=ps-ch:rce_inspire_polygons&outputFormat=text%2Fxml%3B%20subtype%3Dgml%2F3.1.1
              hreflang: nl
```