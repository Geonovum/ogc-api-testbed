# Secured Settings and Vars
This dir contains encrypted files with various credentials and keys.
These are encrypted with ansible-vault. You need the a-v password to decrypt.

**WARNING**

**BE SURE TO ALWAYS ENCRYPT FILES BEFORE COMMITTING TO GITHUB**

**FAILING TO DO SO WILL MAKE THESE FILES AVAILABLE, EVEN IF YOU DELETE THEM!!!!**

**BOTS WILL FIND THEM IN MINUTES**

Files:

* `gh-key.*` SSL pub/priv key for Ansible within GitHub Actions
* `authorized_keys` - set of public keys with users having access to the server VM admin account
* `vars.yml` - Ansible vars included in every playbook
*  [vars.example.yml](vars.example.yml) - example/starter for `vars.yml`

## New Project

* create a new vars.yml from [vars.example.yml](vars.example.yml)
* have your public key as root user in VM
* also adapt `../hosts/*.yml`
* run Ansible bootstrap.yml Playbook
* create `authorized_keys` file and copy to server
