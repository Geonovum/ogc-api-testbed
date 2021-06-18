---
title: pycsw setup
---

# pycsw installation experiences/hints

pycsw is a python implementation of Catalogue Service for the Web as well as OGC API Records.

## Installation

A docker hub image is provided by [geopython](https://hub.docker.com/r/geopython/pycsw). The data folder and the main config file are mounted into the container.

The data folder contains a datafile, alternatively you can upload data to a PostGreSQL database.

The configuration file has main details such as contact information. Check [the documentation](https://docs.pycsw.org) to know which properties are supported.

Installation on the platform has some challenges because we install the software in a subpath. You can mimic running as root via:

- set a stripprefix directive in compose.yml "traefik.http.middlewares.portainer-stripprefix.stripprefix.prefixes=/pycsw"
- tell pycsw to use /pycsw/py.csw as scriptname

Note that /pycsw throws a 500 error for now, but /pycsw/csw.py works fine