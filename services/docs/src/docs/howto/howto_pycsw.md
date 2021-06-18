---
title: HOWTO pycsw
---


# HOWTO pycsw

pycsw operates on a postgres or [sqlite](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pycsw/data/cite.db) backend.
The database is configured in a [configuration file](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/pycsw/pycsw.cfg), together with other common settings.

## Loading data

pycsw has a [tool to load data](https://docs.pycsw.org/en/latest/administration.html#loading-records) from a folder of files.
Alternatively CSW transactions (from for example GeoCat Bridge) can be used to insert data. But transactions need to be explicitely activated and require an authentication mechanism.