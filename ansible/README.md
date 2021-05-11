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
ansible-playbook -vv bootstrap.yml -i hosts/prod.yml

```

### Post on server

* add key.rsa.pub to authorized_keys
