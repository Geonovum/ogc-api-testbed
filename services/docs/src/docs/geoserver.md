# GeoServer installation experiences/hints

GeoServer is a common application server to provide OWS services on various data sources.

## OGC API Community module

The GeoServer community has been involved in the OGC sprints while the standards were shaped to its current form. The implementation of OGC API currently has the form of a [community plugin](https://docs.geoserver.org/latest/en/user/community/ogc-api/index.html), which can be installed on recent versions of GeoServer.

## GeoServer and docker

The installation of GeoServer requires to add the OGC API plugin (check a matching version number). It is quite common that GeoServer is extended with plugins. We used the docker image provided by [oscarfonts](https://github.com/oscarfonts/docker-geoserver), which has a nice mechanism to place plugins (and data folder) on a mounted volume.

In order to configure a new resource on GeoServer we added the required configuration files to the geonovum github repository. GeoServer also has a web interface and rest api to configure resources, but note that any resource added manually may be overwritten from github with the new deployment of the software.

An alternative for manual setup us the [GeoCat bridge](https://geocat.net/bridge) tool, which is a typical tool to configure new resources on GeoServer from within the QGIS or ArcMAP Desktop application.

## OGC API and INSPIRE on GeoServer

To be continued.