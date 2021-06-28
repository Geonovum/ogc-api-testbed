# Demo service for qgis-server - test

Runs latest GitHub `main` branch of `qgis-server` using
its [Docker Image from DockerHub](https://hub.docker.com/r/camptocamp/qgis-server).

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.qgis.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.

## New Service from Duplication

Creating a new service `xyz` via duplication of this directory:

* duplicate this and name it as the service e.g. `services/xyz`
* create GitHub Action file as copy/rename from [GitHub Action](../../.github/workflows/deploy.pycsw.yml) to `deploy.xyz.yml`
* new 3 lines for `xyz` in [Ansible Playbook](../../ansible/deploy.yml)
* the variables, mainly `SERVICE_NAME=xyz` in [env.sh](env.sh).
* adapt at least `url:` (line 32) in [pycsw.cfg](pycsw.cfg)
