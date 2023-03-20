# Team Engine CITE Tests OGC API Features

Runs Team Engine CITE Tests OGC API Features.

See [CITE tester OGC API Features from OGC](https://cite.opengeospatial.org/teamengine/about/ogcapi-features-1.0/1.0/site/) for details.

Docker image used is [ogccite/ets-ogcapi-features10](https://hub.docker.com/r/ogccite/ets-ogcapi-features10).

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.ogccite.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.
 
