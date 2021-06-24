---
title: HOWTO Platform
---

# HOWTO Platform

Describes how to setup your own instance of the OGC API Testbed platform.
As a real-world example, the OGC API Sandbox (Playground) instance is presented below step-by-step.

## 1. Ubuntu Server

Info:

* setup or acquire a Linux Ubuntu server, minimal Ubuntu 20.4 LTS
* can be a VM/VPS or bare metal server, even a local VirtualBox (with Vagrant) instance
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
 
## 3. Prepare Local System

On your local system:

### Install Ansible:

* have Python 3 (3.7 or better) installed
* OPTIONAL (but recommended) create a Python Virtualenv (for Ansible)  
* install [Ansible](https://www.ansible.com/) with `pip install ansible` 2.9.* or higher
* test: `ansible --version` - shows *ansible 2.9.19 ...*
* test: `ansible-vault --version` shows *ansible-vault 2.9.19 ...*
 
More on Ansible below.

### Install `Git` client.

## 4. Clone New GitHub Repo

* `git clone https://github.com/Geonovum/ogc-api-sandbox.git`

We will call the root dir of the cloned git repo on your system just `git/` from here.

## 5. Setup Ansible

Most of the configuration that is specific to your new server 
is stored under `git/ansible/hosts` (Ansible inventories)
and `git/ansible/vars` (variables and SSH keys). 

Most files are encrypted with `Ansible Vault`. You will need to 
create your own (encrypted) version of these encrypted files. 
For many files an example file is given. 

### Ansible Modules

Called "Roles" these are third-party Ansible components that help with specific tasks.
Install these as follows:

```
cd git/ansible
ansible-galaxy install --roles-path ./roles -r requirements.yml
```

### Ansible Hosts
The hostname is crucial to services functioning. Two steps:

* set content of `git/ansible/hosts/prod.yml` (Inventory) to

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
 
So `DEPLOY_ENV=prod` here is to discern with a deployment on `localhost` (`DEPLOY_ENV=local`, where .e.g. no https/SSL is used).

### Create SSH Keys

These are used to invoke actions on the server both from GitHub Actions (via GitHub Sercrets) 
and from your local Ansible setup. Plus a set of authorized_keys for the admin SSH user.

* cd `git/ansible/vars`
* create new SSH keypair (no password): `ssh-keygen -t rsa -q -N "" -f gh-key.rsa`

### Create authorized_keys

Create new `git/ansible/vars/authorized_keys` with your public key and for others you want to give access to the admin SSH account,
plus `gh-key.rsa.pub` .

```
cat gh-key.rsa.pub > authorized_keys
cat ~/.ssh/id.rsa.pub >> authorized_keys
cat id.rsa.pub.of.joe >> authorized_keys   # etc

```

### Adapt vars.yml

Create new `git/ansible/vars/vars.yml` from example `vars.example.yml` in that dir.

The first part of `vars.yml` contains generix, less-secret, values. 
Use variables where possible. Format is Python-Jinja2 template-like:


```
my_ssh_pubkey_file: ~/.ssh/id_rsa.pub
my_email: my@email.nl
my_admin_user: the_admin_username
my_admin_home: "/home/{{ my_admin_user }}"
my_git_home: "{{ my_admin_home }}/git"
my_github_repo: https://github.com/Geonovum/ogc-api-sandbox.git
var_dir: /var/ogcapi
logs_dir: "{{ var_dir }}/log"
services_home: "{{ my_git_home }}/services"
platform_home: "{{ my_git_home }}/platform"
pip_install_packages:
  - name: docker
timezone: Europe/Amsterdam
ufw_open_ports: ['22', '80', '443', '5432']
```
  
The second part deals with more secret values, like usernames and passwords for services.
For most services indicated below with comment after `#`. `GHC_` denotes GeoHealthCheck (GHC) vars.
If you don't use GHC you can skip those.


```
etc_environment:
  PG_DB: the_db  # PostGIS service
  PG_USER: the_user  # PostGIS service
  PG_PASSWORD: the_pw  # PostGIS service
  PGADMIN_EMAIL: the_user@the_user.nl # PGadmin service
  PGADMIN_PASSWORD: the_pw  # PGadmin service
  GHC_SQLALCHEMY_DATABASE_URI: postgresql://the_user:the_pw@the_db:5432/the_db  # PGadmin service
  GHC_ADMIN_USER_NAME: the_user
  GHC_ADMIN_USER_PASSWORD: the_pw
  GHC_ADMIN_USER_EMAIL: the_user@the_user.nl
  GHC_NOTIFICATIONS_EMAIL: the_user@the_user.com
  GHC_SMTP_EMAIL: the_user@the_user.com
  GHC_SMTP_SERVER: smtp.gmail.com
  GHC_SMTP_PORT: 587
  GHC_SMTP_TLS: True
  GHC_SMTP_SSL: False
  GHC_SMTP_USERNAME: the_user@the_user.com
  GHC_SMTP_PASSWORD: the_pw

```

### Create Ansible Vault Password

* global replace `~/.ssh/ansible-vault/ogc-api-testbed.txt` with `~/.ssh/ansible-vault/ogc-api-sandbox.txt` in `git/ansible/README.md`
* create strong password  
* store in `~/.ssh/ansible-vault/ogc-api-sandbox.txt` for convenience

### Set GitHub Secrets

Three secrets need to be set:

Go to GH repo Settings|Secrets and create these three secrets

* ANSIBLE_INVENTORY_PROD - with value from `git/ansible/hosts/prod.yml`
* ANSIBLE_SSH_PRIVATE_KEY - with value from `git/ansible/vars/gh-key.rsa`
* ANSIBLE_VAULT_PASSWORD - value from `~/.ssh/ansible-vault/ogc-api-sandbox.txt` 


### Encrypt Ansible Files

VERY IMPORTANT. UNENCRYPTED FILES SHOULD NEVER BE CHECKED IN!!!

Using `ansible-vault` with password encrypt these:

```
ansible-vault encrypt --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt  vars.yml
ansible-vault encrypt --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt  gh-key.rsa
ansible-vault encrypt --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt  gh-key.rsa.pub 
ansible-vault encrypt --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt  authorized_keys 

```

### Globally Replace apitestbed.geonovum.nl

Under `git/services` replace all occurrences of `apitestbed.geonovum.nl` with `apisandbox.geonovum.nl`
 
### Disable GitHub Workflows

We do not want that workflows take effect immediately. 
So disable them temporary by renaming the dir.

```
git mv workflows workflows.not
git add .
git commit -m "disable workflows"
git push

```

## 6 Prune Repo Tree for Unneeded Services

At this step you may want to delete services you don't need:

* `rm -rf git/docs` . Documentation is already maintained and available via [https://apitestdocs.geonovum.nl/](https://apitestdocs.geonovum.nl/) 
* for each service you want to delete, delete these 3 resources, e.g. for service `xyz`
    * `rm -rf git/services/xyz`
    * `rm  git/.github/workflows/deploy.xyz.yml`
    * in `git/ansible/deploy.yml` delete the three Ansible `task` lines with `xyz` name and tag.

## 7 Bootstrap/provision Server

Moment of truth! Bootstrap (provision the server) in single playbook.

* `ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt bootstrap.yml -i hosts/prod.yml`

If all goes well, this output should be shown at end:

```
PLAY RECAP ***********************************************************************************************************
apisandbox                 : ok=58   changed=22   unreachable=0    failed=0    skipped=8    rescued=0    ignored=0   

```

Observe output for errors (better is to save output in file via `.. > bootstrap.log 2>&1`).

In cases of errors and after fixes, simply rerun the above Playbook.

Site should be running at: [https://apisandbox.geonovum.nl](https://apisandbox.geonovum.nl)
Check with portainer [https://apisandbox.geonovum.nl/portainer/](https://apisandbox.geonovum.nl/portainer/).

## 8 Resolve Issues

These are typical issues found and resolved:

* `/home/oadmin/git` is owned by root, change to `oadmin` 
* delete (or change) CNAME `git/docs/docs`
* permissions in services/qgis/data , make datadir writeable for all: `chmod 777 services/qgis/data`

## 9. Enable GitHub Workflows

Enable by renaming:

```
git mv workflows.not workflows 
git add .
git commit -m "enable workflows"
git push

```
