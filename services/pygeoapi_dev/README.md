# Demo service for pygeoapi - test

Runs latest GitHub `main` branch of `pygeoapi` using
its [Docker Image from DockerHub](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi).
with a [local config file](local.config.yml).

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.pygeoapi.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.
 
## New Service from Duplication

Creating a new service `xyz` via duplication of this directory:

* duplicate this and name it as the service e.g. `services/xyz`
* create GitHub Action file as copy/rename from [GitHub Action](../../.github/workflows/deploy.pygeoapi.yml) to `deploy.xyz.yml`
* new 3 lines for `xyz` in [Ansible Playbook](../../ansible/deploy.yml)
* the variables, mainly `SERVICE_NAME=xyz` in [env.sh](env.sh).
* adapt at least `url:` (line 5) in [local.config.yml](local.config.yml)
