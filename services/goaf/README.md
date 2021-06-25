# ldproxy demo service 
Runs latest [ldproxy](https://github.com/interactive-instruments/ldproxy) using
its [LDProxy Docker Image from DockerHub](https://hub.docker.com/r/iide/ldproxy).
with a [local config file](data/cfg.yml).

Note that the [proxy path is replaced](docker-compose.yml) by Traefik during routing.

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.ldproxy.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.

# Managing Services
`ldproxy` includes a [Manager](https://interactive-instruments.github.io/ldproxy/book/01-managing-services.html) service
to add/configure services and data. This is anabled only locally, as any config will be managed in GitHub and deployed
on remote server.

Access the local manager with the link: http://localhost:8000/manager_ldproxy. 
This will make changes to the data/ directory. These can be committed and deployed.

Services can also be managed by hand but that is a bit more involved.
