---
title: LDProxy installation experiences 
---

# LDProxy installation experiences/hints

ldproxy started out as a prototype in the GeoNovum Geo4Web testbed in 2016. 
Over the years LDProxy has followed the developments around OGC API 
and is currently the most complete implementation of the latest developments in OGC API.

## Installation

A docker hub image is provided by [Interactive Instruments](https://hub.docker.com/r/iide/ldproxy). 

We are using the latest image provided by Interactive Instruments, 
which is a bit behind from the latest version on their docker repository, 
but that repository is not available publicly yet. We found (and reported) 
some issues with the latest public release, which should be solved in the main branch.

We are mounting the config folder to a local volume, the configuration in the 
folder is taken from github. The configuration includes a config file in which logging 
to stdout has been set up.

For this moment we only expose a feature service with a RCE WFS as backend. 
We intend to also add a service with a postgres backend.

The data folder is created by deploying ldproxy locally, setting up the required services and commit the changes to github. You can upload data to the PostGreSQL database and configure a layer on data from the database.

The OGC API's are available via /ldproxy/services.

Configure logging to stdout

Challenges when exposing ldprocy on a subpath

## Issues

* running `ldproxy` on a subpath does not provide proper URLs to internal e.g. CSS resources
* [Issue](https://github.com/interactive-instruments/ldproxy/issues/454) error on accessing collection for RCE WFS

```
Client error, HTTP status 406, Request path : MessageBodyWriter not found for media type=image/avif, 
type=class java.util.ArrayList, genericType=class java.util.ArrayList.

```