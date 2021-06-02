# LDProxy installation experiences/hints

LDProxy started out as a prototype in the GeoNovum Geo4Web testbed in 2016. Over the years LDProxy has followed the developments around OGC API and is currently the most complete implementation of the latest developments in OGC API.

## Installation

We are using the latest image provided by Interactive Instruments, which is a bit behind from the latest version on their docker repository, but that repository is not available publicly yet. We found (and reported) some issues with the latest public release, which should be solved in the main branch.

We are mounting the config folder to a local volume, the configuration in the folder is taken from github. The configuration includes a config file in which logging to stdout has been set up.

For this moment we only expose a feature service with a RCE WFS as backend. We intend to also add a service with a postgres backend.