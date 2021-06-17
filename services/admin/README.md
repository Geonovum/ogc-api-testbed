# Admin Stack

Runs various admin tools/services.

* Portainer (Community Edition)
* GeoHealthCheck

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

### GeoHealthCheck (GHC)
GHC runs with three containers:

* GHC Web Application (`ghc_web`)
* GHC Runner (runs the actual checks) (`ghc_runner`)
* GHC PostgreSQL database stores check config and results (`ghc_db`)

GHC needs quite some variables (around 31, though defaults apply). 
These are all configured once in
[ghc.env](ghc.env). Many variables represent credentials like email and 
database config. These are bundled as `geohealthcheck_env` 
in and forwarded from the encrypted Ansible file `vars.yml`.

The Ansible deploy line applies `geohealthcheck_env` such that these are available
to the `ghc.env` (and thus to the Docker Containers).

```
    - name: "admin"
      shell: "cd {{ services_home }}/admin && ./deploy.sh && docker ps"
      environment: "{{ geohealthcheck_env }}"
      tags: admin

```
