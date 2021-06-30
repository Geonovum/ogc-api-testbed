---
title: HOWTO passwords
---

# HOWTO passwords

Current setup does not have a single sign-on solution. All services have a dedicated password.
All passwords are stored encrypted on Ansible Vault and injected into containers during deployment.

## HOWTO extract passwords

You can decrypt the passwords from the Ansible Vault using the master password, which is circulated separately. 
You need Python and pip to decrypt:

```
pip install Ansible

ansible-vault decrypt git/ansible/vars/vars.yml
```
 
**BE SURE TO NEVER CHECK-IN DECRYPTED FILES IN GITHUB!!**

Always be sure to encrypt after:

```
ansible-vault encrypt git/ansible/vars/vars.yml
```

## HOWTO add or change a password

TODO

## HOWTO reference a ansible password from YAML

TODO
