---
title: HOWTO System Maintenance
---

# HOWTO System Maintenance

Once a platform instance, as in [HOWTO Platform](howto_platform.md), has 
been installed the host system needs to be maintained. In our case the (remote) host 
system runs Ubuntu. A Debian/Ubuntu system is composed of software "Packages". These can
become outdated and need to be updated. Also packages may contain security fixes. 
In some cases all the Docker Containers may need a restart (Service Management).

Below is described how the above is organized and how these tasks are enabled
for a maintainer. 
**NB all this applies to the host/VM system-OS, not the OS-es that run within the Docker Containers!!*
 
`~/.ssh/ansible-vault/ogc-api-sandbox.txt` is the file containing your Ansible Vault password.

## Security Updates

Automatic updates of (Ubuntu) security fixes/patches is already done automatically.
During the [Ansible Bootstrap](https://github.com/Geonovum/ogc-api-testbed/blob/main/ansible/bootstrap.yml) phase,
the Ansible Module [justb4.ubuntu-base](https://github.com/justb4/ansible-ubuntu-base) will enable 
automatic security updates.

Details: the specific Ansible Task [can be found here](https://github.com/justb4/ansible-ubuntu-base/blob/master/tasks/main.yml#L41).

## Service Management

All Docker containers can be started/stopped by a Ubuntu `systemd` service called `ogcapi`. 

The following Ansible tasks are available:

```
ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt service.yml -i hosts/prod.yml --tags status

ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt service.yml -i hosts/prod.yml --tags stop

ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt service.yml -i hosts/prod.yml --tags start

```
 

## System Management

The Ubuntu "APT" packages can be maintained remotely with Ansible. The host system can even be rebooted remotely. 
The systemd service `ogcapi` (see Service Management) and thus all Docker Containers will be started 
automatically.

The following Ansible tasks are available:

```
# Update outdated Packages
ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt system.yml -i hosts/prod.yml --tags update_packages

# Reboot - all services should come back up
ansible-playbook -v --vault-password-file ~/.ssh/ansible-vault/ogc-api-sandbox.txt system.yml -i hosts/prod.yml --tags reboot

```
