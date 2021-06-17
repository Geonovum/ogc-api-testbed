---
title: Setup qgis
---

# Setup qgis

[qgis](https://qgis.org) is a desktop as well as a server solution. The server solution provides typical OGC services sucha as WMS, WFS. Since recently also OGC API Features is available. 

Deployed docker image from
https://hub.docker.com/r/camptocamp/qgis-server.
Following the hints from  https://www.qcooperative.net/blog/ogcapif/ and https://docs.qgis.org/testing/en/docs/server_manual/services.html#wfs3-ogc-api-features

## Issues

I had a hard time finding in documentation what the url is to open ogc api features endpoint, it appears to be '[/qgis/wfs3](/qgis/wfs3)'. I assume this will likely be changed in upcoming versions.

Somehow the feature collections are not loaded, although the [WMS](/qgis?request=getcapabilities&service=WMS) is able to display them