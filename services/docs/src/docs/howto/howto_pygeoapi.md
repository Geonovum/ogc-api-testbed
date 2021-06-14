# How To pygeoapi

A docker hub image is provided by [geopython](https://hub.docker.com/r/geopython/pygeoapi). The data folder and a config file are mounted into the container.

The data folder contains the datafiles, alternatively you can upload data to the PostGreSQL database and configure a layer on data from the database.

The configuration file contains references to the collections which are exposed via the OGC API's. Check the documentation to know which backends are supported.

You need to set up an instance of pygeoapi for each series of collections you want to serve on an endpoint.


