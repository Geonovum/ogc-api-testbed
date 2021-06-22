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
