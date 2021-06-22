---
title: Service deployment
---

# Service deployment

The api testbed environment uses a configuration mechanism stored in GitHub. 
Whenever a commit is detected on the configuration repository, 
a deployment of the changed service is triggered automatically. 
Such an approach is known as [Continuous Deployment](https://en.wikipedia.org/wiki/Continuous_deployment). While a deployment task is running, you can follow it on [github](https://github.com/Geonovum/ogc-api-testbed/actions).

It is possible to directly commit your changes to GitHub, but a better practice is to work from [Pull Requests](https://en.wikipedia.org/wiki/Distributed_version_control#Pull_requests). Some discussion and an approval process can happen around a pull request, before it is merged and deployed.

For your case, decide if you want to update an existing service or create a new service. All services in the platform are available as paths on a single domain. Each service contains an orchestration of a number of [docker containers](https://en.wikipedia.org/wiki/Docker_(software)), which together provide the functionality of the service. Docker containers are based on of-the-shelf product images from docker hub, combined with a service specific configuration.

## Update a service

Change the required files on an existing service folder. Either directly on github, but preferably by cloning the repository locally, make the changes, commit, and push the changes.

## Create a new service

Normal approach would be to duplicate a configuration folder of an existing service and change the required parameters within that folder. Also duplicate a service definition in the [ansible configuration file](https://github.com/Geonovum/ogc-api-testbed/blob/main/ansible/deploy.yml), using a unique name for the service (folder) and set up a github action for the service in https://github.com/Geonovum/ogc-api-testbed/tree/main/.github/workflows.

```
    - name: "pygeoapi"
      shell: "cd {{ services_home }}/pygeoapi && ./deploy.sh && docker ps"
      tags: pygeoapi
```

## Testing your service

You can either directly commit the service configuration in the sandbox and evaluate if it behaves properly. Alternatively you can clone the full repository locally and run the environment locally (installation of docker desktop is required) before committing. Always test your service in the sandbox environment before duplicating it to the production environment.

Navigate to the /services folder in the project and run ./start.sh