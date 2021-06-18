---
title: Setup QGIS Server
---

# Setup QGIS Server

[qgis](https://qgis.org) is a desktop as well as a server solution. The server solution provides typical OGC services sucha as WMS, WFS. Since recently also OGC API Features is available. 

Deployed docker image from
https://hub.docker.com/r/camptocamp/qgis-server.
Following the hints from  
https://www.qcooperative.net/blog/ogcapif/ and https://docs.qgis.org/testing/en/docs/server_manual/services.html#wfs3-ogc-api-features

## Issues

I had a hard time finding in documentation what the 
url is to open ogc api features endpoint, 
it appears to be '[/qgis/wfs3](/qgis/wfs3)'. 
I assume this will likely be changed in upcoming versions.

Somehow the feature collections are not loaded, 
although the [WMS](/qgis?request=getcapabilities&service=WMS) is able to display them

### Container Write Permission
Could not use the default `/etc/qgisserver/project.qgs` Docker volume mapping, as the
referenced GPKG files needed write access (for WAL files) in that dir.
The solutions was to set `QGIS_PROJECT_FILE` explicitly. However it resulted in a working situation, but the project file could not be located by the service. So I restored the situation. It means we still have no write privileges in the data folder.

```
    environment:
      # Must override default to allow write access e.g. GPKG WALs for www-data user
      - QGIS_PROJECT_FILE:/myqgisserver/project.qgs

      #- QGIS_SERVER_LOG_LEVEL:0
      #- PGSERVICEFILE:If you want to change the default of /etc/qgisserver/pg_service.conf
      #- QGIS_PROJECT_FILE:If you want to change the default of /etc/qgisserver/project.qgs
      #- MAX_REQUESTS_PER_PROCESS:The number of requests a QGIS server will serve before being restarted by apache
      #- QGIS_CATCH_SEGV:1

    volumes:
      # Map data and config into container
      - ./data:/myqgisserver
```

### Publish layers as WFS on the project

I ran into the problem that the layers were displayed on the WMS capabilities, but not as collections on ogc api features. I requested help from the qgis mailinglist, but no direct solution. Until Allesandro Pasotti pointed me on the fact that I have to activate WFS on layers before they are available via WFS and OGC API Features. You can set WFS access via project properties > QGIS Server > WFS.
