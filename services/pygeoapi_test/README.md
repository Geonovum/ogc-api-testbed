# pygeoapi demo service - test

Runs latest GitHub master branch of `pygeoapi` using
[Docker Image from DockerHub](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi).
with a [local config file](local.config.yml).

A local [Docker Image](Dockerfile) is [built](build.sh) named `geopython/pygeoapi_test:latest` 
that mainly copies in the [demo config](local.config.yml).
