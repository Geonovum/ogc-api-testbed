---
title: Service Deployment
---

# Service Deployment

The API testbed environment uses a configuration mechanism stored in the GitHub repository. 
Whenever GitHub detects a commit in the repository, 
a deployment on the remote server of the changed service is triggered automatically. 
Such an approach is known as [Continuous Deployment](https://en.wikipedia.org/wiki/Continuous_deployment) or "CD".

The API Testbed uses Ansible and GitHub Workflows to enable CD. Effectively, new or changed Docker Containers
and their configuration are deployed on a remote server (VM/VPS) from within GitHub.

While a deployment task is running, you can follow its progress 
on [GitHub](https://github.com/Geonovum/ogc-api-testbed/actions).

It is possible to directly commit your changes to GitHub, but a better practice is to 
work from [Pull Requests](https://en.wikipedia.org/wiki/Distributed_version_control#Pull_requests) often called a **PR**. 
Some discussion and an 
approval process can happen around a Pull Request, before it is merged and deployed.

For your case, decide if you want to update an existing service or create a new service. 
All services in the platform are available as paths on a single domain. 
Each service contains an orchestration of one or more [Docker Containers](https://en.wikipedia.org/wiki/Docker_(software)), 
which together provide the functionality of the service. Docker containers are based on of-the-shelf 
product images from DockerHub, combined with a service-specific configuration.

## Update a service

Change the required files on an existing service folder. 
Either directly on GitHub, but preferably by cloning the repository locally and issuing a PR. 
Make the changes, commit, and push the changes.

## Create a new service
Firstly determine if you can instead update a service, for example with a new Collection, somewhat
similar to a Layer.

For a new service the best approach is to duplicate the entire folder of an existing service and change the required 
parameters within that folder. NB be sure to also preserve the executable properties of the `.sh` (Shell) files! 
Assumed is that the new service is using one of the existing components, thus services for
GeoServer, pygeoapi, ldproxy etc.

Creating a new service is basically the following multi-step process:

### Step 1 - Duplicate Folder

Duplicate the entire folder of an existing service and name it to the new service, say `xyz`.
So it will reside in the folder `git/services/xyz/`.

### Step 2 - Adapt Variables

In the best case only a single line in the file `git/services/xyz/env.sh` needs 
to be adapted, i.e. the `SERVICE_NAME` variable. This will then automatically
propagate the value for the subpath in the full service-URL plus other settings within the `docker-compose.yml` file.
In the best case `docker-compose.yml` requires no changes.

### Step 3 - Adapt Service Config and Data File(s)

This step is specific to the service-component. 
For example `pygeoapi` has a single `local.config.yml`
file. In many cases the full service URL with the subpath needs to be adapted.
Others, like GOAF, may need var-settings in the `docker-compose.yml` file.
Usually you will add data files like GeoPackage-files on a `/data/` subfolder.

### Step 4 - Adapt Ansible Deploy File

Duplicate a service definition in 
the [Ansible Playbook file deploy.yml](https://github.com/Geonovum/ogc-api-testbed/blob/main/ansible/deploy.yml).
This file is under `git/ansible/deploy.yml`.

Use the service name for the service (folder) like:

```
    - name: "xyz"
      shell: "cd {{ services_home }}/xyz && ./deploy.sh && docker ps"
      tags: xyz
```


### Step 5 - Create a GitHub Action File

This is a Action/Workflow File always to be placed under
[.github/workflows](https://github.com/Geonovum/ogc-api-testbed/blob/main/.github/workflows) 
GitHub should execute this file (for our repo)  when two conditions are met: 

1) a commit (direct or via a PR) to the `main` repository branch and 
2) when the change is made to the new `services/xyz` folder (or a subfolder).

Also here: easiest is to copy any existing service deploy file 
like [deploy.pygeoapi.yml](https://github.com/Geonovum/ogc-api-testbed/blob/main/.github/workflows/deploy.pygeoapi.yml) and make a global
change e.g. "pygeoapi" to "xyz".

The file should look like:

```
name: xyz Deploy ⚙️

# Trigger only when services/xyz subdir changed
on:
  push:
    paths:
      - 'services/xyz/**'

jobs:
  main:
    runs-on: ubuntu-20.04

    steps:
    - name: Checkout ✅
      uses: actions/checkout@v2

    - name: Run playbook ⚙
      uses: dawidd6/action-ansible-playbook@v2
      with:
        playbook: deploy.yml
        directory: ./ansible
        key: ${{secrets.ANSIBLE_SSH_PRIVATE_KEY}}
        inventory: ${{secrets.ANSIBLE_INVENTORY_PROD}}
        vault_password: ${{secrets.ANSIBLE_VAULT_PASSWORD}}
        options: |
          --tags xyz
          --verbose

```

Basically this file will execute the above Ansible Playbook `deploy.yml` for the tag `xyz` whenever a
change is committed/pushed to the `services/xyz/` folder.

## Testing your service

You can either directly commit the service configuration in the sandbox and evaluate if it 
behaves properly. Alternatively you can clone the full repository locally and run the environment locally 
(installation of docker desktop is required) before committing. Always test your service in the sandbox 
environment before duplicating it to the production environment.

Navigate to the `git/services/` folder in the project and run `./start.sh`
