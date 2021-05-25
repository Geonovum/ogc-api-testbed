# Traefik

## Debug Log follow

    docker exec -it traefik tail -f /var/log/traefik/traefik.log 

## Dynamic File Provider
See `--providers.file.directory=/etc/traefikdyn` in docker-compose.yml.
These are under [dynconfig](dynconfig) and mapped to Traefik container `/etc/traefikdyn`
TLS options seems only be possible (in Docker) via Traefik File Provider.
  

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.traefik.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.
  