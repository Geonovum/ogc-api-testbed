# OGC API Server
Bootstrap and continuous deployment/integration (CI) for OGC API web-service components.

## Summary

This repo contains all that is needed to bootstrap, configure and maintain (CI) a remote
deployment of an OGC API web-service stack using modern "DevOps" tooling.

The main design principles are:

* any action on the server/VM is performed remotely
* i.e. no direct access/login to/on the server/VM is required, only maybe for problem solving
* remote actions can be performed manually or triggered by GitHub Workflows
* all credentials (passwords, SSH-keys, etc) are secured 
* both a "stable" and "experimental" stack should be available

The (DevOps-) components for this setup are:

* [Docker](https://www.docker.com/) *"...OS-level virtualization to deliver software in packages called containers..."* ([Wikipedia](https://en.wikipedia.org/wiki/Docker_(software)))
* [Docker Compose](https://docs.docker.com/compose) *"...a tool for defining and running multi-container Docker applications..."*
* [Ansible](https://www.ansible.com/) *"...an open-source software provisioning tool"* ([Wikipedia](https://en.wikipedia.org/wiki/Ansible_(software)))
* [GitHub Actions/Workflows](https://docs.github.com/en/actions) *"...Automate, customize, and execute software development workflows in a GitHub repository..."*

The Docker-components are used to run the operational stack, i.e. the OGC API web-services. Ansible is used to provision both the server OS-software
and the operational stack. Ansible is executed on a local client/desktop system to invoke operations on a remote server/VM.
These operations are bundled in so called Ansible Playbooks, YAML files that describe a desired server state.
GitHub Actions are used to construct Workflows. These Actions will invoke these Ansible Playbooks, effectively configuring
and provisioning the operational stack on a remote server/VM. 
                    
Security is guaranteed by the use of [Ansible-Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html) 
and [GitHub Encrypted Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets).

The operational stack is composed with the following components:

* [Traefik](https://traefik.io/) a frontend proxy/load-balancer and SSL (HTTPS) endpoint.
* [pygeoapi](https://pygeoapi.io/) a Python server implementation of the OGC API suite of standards.
* to be determined: [GeoServer](http://geoserver.org/), [ldproxy](https://interactive-instruments.github.io/ldproxy/), ...
* [mkdocs](https://www.mkdocs.org/) for live documentation
* both an experimental and stable stack instance is available

The above setup has been used with success in several projects like 
the [pygeoapi demo server](https://demo.pygeoapi.io/).

## Steps and Workflows

These can be used to setup a running server from zero.

### Step 0 - Obtain access to server/VM
This implies acquiring a server/VM instance from a hosting provider.
Main requirements are that server/VM runs an LTS Ubuntu (20.4 or better) and that SSL-keys are available for root access 
(or an admin user account with sudo-rights).

### Step 1 - Clone this repo

`git clone https://github.com/justb4/ogc-api-srv.git`.

### Step 2 - Bootstrap the server/VM
"Bootstrap" here implies the complete provisioning of a remote server/VM that runs the operational service stack.
This is a one-time manual action, but can be executed at any time as Ansible actions are idempotent.
By its nature, Ansible tasks will only change the system if there is something to do.

Startpoint is a fresh Ubuntu-server or VM with root access via SSH-keys (no passwords).
The Ansible playbook [bootstrap.yml](ansible/bootstrap.yml) installs the neccessary software, and hardens
the server security, e.g. using [fail2ban](https://www.fail2ban.org/).
In this step Docker and Docker Compose are installed and a Linux [systemd](https://en.wikipedia.org/wiki/Systemd) service is run
that automatically starts/stops the operational stack, also on reboots.
The software for the operational stack, i.e. from this repo, is cloned on the server as well.

### Step 3 - Maintain the server/VM
This step is the daily operational maintenance. 
The basic substeps are:

* make a change, e.g. add a data Collection to an OGC API OAFeat service
* commit/push the change to GitHub
* watch the triggered GitHub Actions, check for any errors
* observe changes via website
