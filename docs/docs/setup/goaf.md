---
title: Setup GOAF
---

# Setup GOAF

[GOAF](https://github.com/PDOK/goaf) is a OAF implementaion in Go, maintained by PDOK, originally developed as [Jivan](https://github.com/go-spatial/jivan).

GOAF image used from https://hub.docker.com/r/pdok/wfs-3.0, this is an older version, but PDOK has not updated yet. Alternative could be to build the image from sources.

GOAF supports a PostGres or GeoPackage backend. Which file to serve the type of file are injected as environment variables.

We have added the default BRT image provided by PDOK as example.

