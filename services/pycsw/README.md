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
