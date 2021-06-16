---
title: HOWTO passwords
---

# HOWTO passwords

Current setup does not have a single signon solution. All services have a dedicated password.
All passwords are stored encrypted on Ansible Vault and injected into containers during deployment.

## HOWTO extract passwords

You can decrypt the passwords from the ansible vault using the master password, which is circulated separately. You need python and pip to decrypt:

```
pip install Ansible
ansible-vault decrypt https://github.com/Geonovum/ogc-api-testbed/raw/main/ansible/vars/vars.yml
```

## HOWTO add or change a password

## HOWTO reference a ansible password from YAML




