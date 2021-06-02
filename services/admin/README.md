# Admin Stack

Runs various admin tools/services.

* Portainer (Community Edition)
* GeoHealthCheck (TODO)

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.admin.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.

## Specifics
### Portainer

* Image: https://hub.docker.com/r/portainer/portainer-ce/

**Admin Password**

Encrypted version, generated with Apache Utils

```
docker run --rm httpd:2.4-alpine htpasswd -nbB admin "THE PASSWORD" | cut -d ":" -f 2 

```

Note escaped `$` in docker-compose.yml

```
 - --admin-password=$$2y$$05$$VCjhk4z8mhi8V0DpXHX56.W1jy0sNWHOwSQbXVCYPyLs/WanBODPq

```