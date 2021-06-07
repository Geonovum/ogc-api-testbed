# How To GeoServer

A docker hub image is provided by [oscarfonts](https://github.com/oscarfonts/docker-geoserver) is extended with OGC API plugin. The binaries of the plugin, as well as the data folder are mounted into the container.

The data folder is created by deploying geoserver locally, setting up the required services and commit the changes to github. You can either embed a data file inside the data folder, alternatively you can upload data to the PostGreSQL database and configure a layer on data from the database.

The OGC API is available from the geoserver homepage at /ogc/features, or on the workspace endpoint /{workspace}/agc/features.

