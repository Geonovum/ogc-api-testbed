# Demo service for GeoServer

Runs `GeoServer` using the `latest`
[Oscar Fonts' GeoServer Docker Image](https://github.com/oscarfonts/docker-geoserver)
from [DockerHub](https://hub.docker.com/r/oscarfonts/geoserver).

This instance also includes the [GeoServer OGC API Community Plugin](https://docs.geoserver.org/latest/en/user/community/ogc-api/index.html).
See also: https://github.com/geoserver/geoserver/tree/main/src/community/ogcapi

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.geoserver.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.

## Scripts

* [start.sh](start.sh) - start Docker container
* [stop.sh](stop.sh) - stop Docker container - calls [fix-perms.sh](fix-perms.sh)
* [fix-perms.sh](fix-perms.sh) - fix mounted dir permissions, see [this issue](https://github.com/Geonovum/ogc-api-testbed/issues/22)
* [deploy.sh](deploy.sh) - all-in-one deployment, called by Ansible [deploy.yml Playbook](../../ansible/deploy.yml)
