---
title: HOWTOs
---

# HOWTOs

2 sections of HOWTOs exist. 
This section describes the general aspect of How To manage services in the sandbox and production environment.

The other section describes product specific How To Aspects:

* [How To pygeoapi](howto_pygeoapi.md)
* [How To GeoServer](howto_geoserver.md)
* [How To LDProxy](howto_ldproxy.md)

## Service deployment

The api testbed environment uses a configuration mechanism stored in GitHub. Whenever a commit is detected on the configuration repository, a deployment of the environment is triggered automatically. Such an approach is known as [Continuos Deployment](https://en.wikipedia.org/wiki/Continuous_deployment).

It is possible to directly commit your changes to GitHub, but a better practice is to work from [Pull Requests](https://en.wikipedia.org/wiki/Distributed_version_control#Pull_requests). Some discussion and an approvel process can happen around a pull request, before it is merged and deployed.

For your case, decide if you want to update an existing service or create a new service. A service is a deployed software on a subpath. All services in the environment are available as paths on a single domain. Each service contains an orchestration of a number of [docker containers](https://en.wikipedia.org/wiki/Docker_(software)), which together provide the functionality of the service. Docker containers are based on of-the-shelf product images from docker hub, combined with a service specific configuration.

### Update a service

Change the required files on the existing service folder.

### Create a new service

An optimal approach is to duplicate the configuration folder of an existing service and change the required parameters within that folder. Also duplicate a service definition in the [ansible configuration file](https://github.com/Geonovum/ogc-api-testbed/blob/main/ansible/deploy.yml), using a unique name for the service (folder).

```
    - name: "pygeoapi"
      shell: "cd {{ services_home }}/pygeoapi && ./deploy.sh && docker ps"
      tags: pygeoapi
```

## Testing your service

You can either directly commit the service configuration in the sandbox and evaluate if it behaves properly. Alternatively you can clone the full repository locally and run the environment locally (installation of docker desktop is required) before committing. Always test your service in the sandbox environment before duplicating it to the production environment.