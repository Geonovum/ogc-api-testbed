---
title: HOWTO Platform
---

# HOWTO Platform

Describes how to setup your own instance of the OGC API Testbed.
As a working example the OGC API Sandbox (Playground) instance is presented step-by-step.

## 1. Ubuntu Server

Info:

* setup or acquire a Linux Ubuntu server, minimal Ubuntu 20.4 LTS
* can be a VM/VPS or bare metal server
* Sandbox specs: 4CPU, 16RAM, 100GB  but also strongly depends on the services one needs to run
* root access via SSH required
* DNS: create A-record `apisandbox.geonovum.nl` for IP address `109.237.219.249`
* OPTIONAL: DNS: if you need docs (not for Sandbox) create CNAME and set in `git/docs/docs/CNAME`
* copy your SSH public key to `/root/.ssh/authorized_keys`, e.g. `scp ~/.ssh/id_rsa.pub root@apisandbox.geonovum.nl:.ssh/authorized_keys`
* test login with SSH key: `ssh root@apisandbox.geonovum.nl`
* upgrade server to latest: `apt-get update && apt-get -y upgrade`

## 2. Generate GitHub Repo

Create a GitHub repository from the Template repo [github.com/Geonovum/ogc-api-sandbox](https://github.com/Geonovum/ogc-api-sandbox).

Creating a repository from a template is similar to forking a repository, but there are important differences:

* A new fork includes the entire commit history of the parent repository, while a repository created from a template starts with a single commit.
* Commits to a fork don't appear in your contributions graph, while commits to a repository created from a template do appear in your contribution graph.
* A fork can be a temporary way to contribute code to an existing project, while creating a repository from a template starts a new project quickly.

Steps (see also [here](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/creating-a-repository-from-a-template):

* login on GitHub
* go to [github.com/Geonovum/ogc-api-testbed](https://github.com/Geonovum/ogc-api-testbed)
* above file list press green button "Use this template"
* follow the steps indicated, if you want to serve docs on a separate domain indicate "Include all branches"
 
## 3. Prepare local system

On your local system:

* be sure to have Python 3 (3.7 or better) installed
* OPTIONAL (but recommended) create a Python Virtualenv (for Ansible)  
* install [Ansible](https://www.ansible.com/) with `pip install ansible` 2.9.* or higher
* test: `ansible --version` - shows *ansible 2.9.19 ...*
* test: `ansible-vault --version` shows *ansible-vault 2.9.19 ...*
* install Ansible modules, "roles": `ansible-galaxy install --roles-path ./roles -r requirements.yml`

## 4. Clone new repo

* `git clone https://github.com/Geonovum/ogc-api-sandbox.git`

We will call the root dir of the cloned git repo on your system just `git/` from here.

## 5. Adapt Ansible Config

Most of the configuration specific to the server is stored under `git/ansible/hosts` (Ansible inventories)
and `git/ansible/vars`. Most files are encrypted with `Ansible Vault`. You will need to 
create your own (encrypted) version of these encrypted files. For many files an example file is given. 

### Ansible Hosts
The hostname is crucial to services functioning. Two steps:

* set content of `git/ansible/hosts/prod.yml` to

```
ogcapi:
  hosts:
    apisandbox:
       ansible_port: 22
       ansible_host: apisandbox.geonovum.nl
       ansible_user: root

```

* set content of `git/services/env.sh` to:

```
#!/bin/bash
# Sets global env vars based on host-name
# Needed for various host-dependent configs, especiallly Traefik SSL-certs.

# Export and Defaults

# Assume a local deployment
export DEPLOY_ENV="local"
export TRAEFIK_SSL_ENDPOINT=
export TRAEFIK_SSL_DOMAIN="apisandbox.geonovum.nl"
export TRAEFIK_SSL_CERT_RESOLVER=
export TRAEFIK_USE_TLS="false"
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)
export HOST_UID_GID="${HOST_UID}:${HOST_GID}"

# Set host-dependent vars
case "${HOSTNAME}" in
    "apisandbox.geonovum.nl")
        DEPLOY_ENV="prod"
        ;;
    "apisandbox")
        DEPLOY_ENV="prod"
        ;;
    *)
        echo "Default Local Host ${HOSTNAME}"
esac

if [[ ${DEPLOY_ENV} = "prod" ]]
then
	source /etc/environment
    TRAEFIK_SSL_ENDPOINT="https"
    TRAEFIK_SSL_CERT_RESOLVER="le"
    TRAEFIK_USE_TLS="true"
fi

```
 
So `DEPLOY_ENV=prod` here is to discern with a deployment on `localhost` (`DEPLOY_ENV=local`, where .e.g. no https/SSL is used)

### Create SSH Keys

These are used to invoke actions on the server both from GitHub Actions (via GitHub Sercrets) and from your local Ansible setup. Plus a set of authorized_keys 
for the admin SSH user.

* cd `git/ansible/vars`
* create new keypair (no password): `ssh-keygen -t rsa -q -N "" -f gh-key.rsa`

### Create authorized_keys

Create new `git/ansible/vars/authorized_keys` with your public key and `gh-key.rsa.pub` .

### Adapt vars.yml

Create new `git/ansible/vars/vars.yml` from example in that dir.

### Create Ansible Vault password

* global replace `~/.ssh/ansible-vault/ogc-api-testbed.txt` with `~/.ssh/ansible-vault/ogc-api-sandbox.txt` in `git/ansible/README.md`
* create strong password  
* store in `~/.ssh/ansible-vault/ogc-api-sandbox.txt` for convenience

### Set GitHub Secrets

Three secrets need to be set:

Go to GH repo Settings|Secrets and create these three secrets

* ANSIBLE_INVENTORY_PROD - with value from `git/ansible/hosts/prod.yml`
* ANSIBLE_SSH_PRIVATE_KEY - with value from `git/ansible/vars/gh-key.rsa`
* ANSIBLE_VAULT_PASSWORD - value from `~/.ssh/ansible-vault/ogc-api-sandbox.txt` 


### Encrypt files

VERY IMPORTANT. UNENCRYPTED FILES SHOULD NEVER BE CHECKED IN!!!

Using `ansible-vault`:

```
ansible-vault encrypt --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt  vars.yml
ansible-vault encrypt --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt  gh-key.rsa
ansible-vault encrypt --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt  gh-key.rsa.pub 
ansible-vault encrypt --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt  authorized_keys 

```

### Global replace apitestbed.geonovum.nl

Under `git/services` all occurences with `apisandbox.geonovum.nl`
 
### Disable workflows

Temporary.

```
git mv workflows workflows.not
git add .
git commit -m "disable workflows"
git push


```

## 6 Bootstrap/provision Server

Op server eerst pip installeren:

* `apt-get install python3-pip`
 
dan inspoelen:

* `ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt bootstrap.yml -i hosts/prod.yml`

Issues oplossen:

* `/home/oadmin/git` is owned by root, change to `oadmin` 
* CNAME in `git/docs/docs` moet weg 
