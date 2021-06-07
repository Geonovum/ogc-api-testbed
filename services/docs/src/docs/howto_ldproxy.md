# How To ldproxy

A docker hub image is provided by [Interactive Instruments]https://hub.docker.com/r/iide/ldproxy). The data folder is mounted into the container.

The data folder is created by deploying ldproxy locally, setting up the required services and commit the changes to github. You can upload data to the PostGreSQL database and configure a layer on data from the database.

The OGC API's are available via /ldproxy/services.

