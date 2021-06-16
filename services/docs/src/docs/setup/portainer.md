---
title: Setup portainer
---

# Setup portainer

[Portainer](portainer.io) is a comprehensive webbased tool to monitor running containers in a Docker environment. It connects to Docker enginge to be notified of changes in running containers and hardware usage. From the user interface you can view logs, restart containers, even ssh into a container.

Portainer is deployed from https://hub.docker.com/r/portainer/portainer. The portainer data folder is mounted from the host.

Portainer is clustered with GeoHealthCheck in a single orchestration.

Portainer is available at [/portainer/](/portainer/). Do not skip the trailing slash.