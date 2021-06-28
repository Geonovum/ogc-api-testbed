---
title: HOWTO Analyse Errors
---

# HOWTO Analyse Errors

Error analyses is a bit hidden but the platform has various options to analyse challenges.

## Errors during deployment

When you push a configuration change to github, a github action will trigger 
to deploy the change to the platform. If such an action fails (the service is not available), the first step 
is to open [github actions](https://github.com/Geonovum/ogc-api-testbed/actions) and select the action related to your recent push. You can view the log of the action to look for a cause of the error.

If you were not able to resolve the issue with above information, you can try to look for problems inside the 
container, as described in the runtime error section.

A next step is to run the full platform locally, as described in [Run locally](./howto_platform.md). And see if the problem can be resolved locally.

A final step would be to roll back the change to restore the previous state of the platform.

## Runtime errors

Run time errors, such as incidental error pages, page not found/unresponsive, etc are best anaylised 
via [portainer](./howto_portainer.md). It is important to know the name of the container causing the error. 
This name is assigned in the docker-compose file from which the project originates.

Find the relevant container in portainer. From there you can view the logs of the conatainer, restart 
it and even open a webbased command line client to it.

## Unavailability

Services being unavailable can have various causes. A first place to check is [GeoHealthCheck](./howto_ghc.md) to evaluate if other services also have problems and how long the problem already exists. Usually restarting the service via portainer will resolve the issue. Else there may be a deployment problem (in a worse case scenario it is caused by the deployment of another service).


