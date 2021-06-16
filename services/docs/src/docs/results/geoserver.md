---
title: Findings GeoServer
---

# Findings GeoServer

A docker hub image is provided by [oscarfonts](https://github.com/oscarfonts/docker-geoserver) is extended with OGC API plugin. The binaries of the plugin, as well as the data folder are mounted into the container. The `Oscar Fonts` image runs as a tomcat user, which by itself is a good practice from security prespective, but files are created on the data folder by a user unknown to the docker host, which causes problems at redeployment. We have overridden this behaviour and run as root user.

The data folder is created by deploying geoserver locally, setting up the required services and commit the changes to github. You can either embed a data file inside the data folder, alternatively you can upload data to the PostGreSQL database and configure a layer on data from the database.

The OGC API is available from the geoserver homepage at /ogc/features, or on the workspace endpoint /{workspace}/agc/features.

## Scripted configuration vs dynamic configuration

GeoServer has an extended web user interface as well as a rest api to configure the publication of datasets. These configurations are persisted as xml files in the config folder. Alternatively you can use a scripted approach to configure the server, the xml files in the conig folder are deployed as part of the deployment. Both approaches can however not easily be combined. It means you have to decide for a server if you set it up scripted or dynamically. The scripted approach is mostly used in advanced setups such as App Schema INSPIRE.

Most challenging is a sequential update number which is updated with every dynamic update of the configuration via the api.

The configuration with xml files is also a challenge when scaling out and load balancing GeoServer. When these files are updated by one instance, the other instances need to be synchronised. Some community plugins are available, such as jdbc-config, which enables the storage of configuration in a central database. 

## GeoServer behind a gateway (traefik)

Running GeoServer behind a gateway, which exposes geoserver at an alternative domain, requires a proxy url to be configured on GeoServer. You need to manage this in an xml file, because the admin interface (which offers an option to configure this also) doesn't work correctly if the proxy url is not correctly set up.

Recent versions of GeoServer have added a CSRF protection against script attacks. This CSRF leads to unexpected results when running GeoServer via a gateway. The gateway domain needs to be whitelisted or CSRF vealidation deactivated. Read more at https://docs.geoserver.org/stable/en/user/security/webadmin/csrf.html

## Open research questions
- how are metadata links configured on layers, exposed in ogc api features
- are there an options to fetch gml, app-schema gml and/or geopackage via ogc-api features