# ldproxy demo service 
Runs latest [ldproxy](https://github.com/interactive-instruments/ldproxy) using
its [LDProxy Docker Image from DockerHub](https://hub.docker.com/r/iide/ldproxy).
with a [local config file](data/cfg.yml).

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.ldproxy.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.
