# Maintain with Ansible

Ansible is used to install, configure and maintain the entire server.

## Virtualenv

On your local system install ansible (a v2 version) in virtual env.
For example:


```
pyenv activate ansible-python-3.7.1
pip install ansible==2.9.19
pyenv rehash
```

## Key management

```
ssh-keygen -t rsa -q -N "" -f vars/key.rsa

```

## Install required Roles

Here in local dir `roles` :

```

mkdir roles
ansible-galaxy install --roles-path ./roles -r requirements.yml

```

## Bootstrap

### Pre on server

* create Hetzner VM server, server name `OGCAPI-1`
* add firewall "web"  
* paste your SSH public key (no password access)

### Ansible
```

# Installs entire system PROD
ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt bootstrap.yml -i hosts/prod.yml

```

### Post on server

* add key.rsa.pub to authorized_keys


## Test if working

Basic sanity test:

```
ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt test.yml -i hosts/prod.yml


```

## Deploy

Deploy individual services:

```
ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt deploy.yml -i hosts/prod.yml --tags traefik

ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt deploy.yml -i hosts/prod.yml --tags pygeoapi

ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt deploy.yml -i hosts/prod.yml --tags postgis

ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt deploy.yml -i hosts/prod.yml --tags admin

```

## System

Manage ogcapi `systemd` service:

```
ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt service.yml -i hosts/prod.yml --tags status

ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt service.yml -i hosts/prod.yml --tags stop

ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-testbed.txt service.yml -i hosts/prod.yml --tags start

```
