---
title: Installation findings
---

# Installation findings
This document lists some of the experiences during installation and creation of the software, for example:

* what is easy to do, what not?
* what is supported by which software?
* configuration setup

## Docker

Docker (and related technologies such as kubernetes, cloud foundry) are replacing traditional web servers following the [pet vs cattle](https://www.hava.io/blog/cattle-vs-pets-devops-explained) paradigm. Many pro's and con's are documented. We list a number of them which came up during the project.

Pro's

* For setups of pygeoapi and geoserver with OGR support (used in wfs and geopackage backend) the use of Docker is attractive, due to complexity of managing dedicated dependencies.
* Running the full platform locally doesn't require any effort. Traefik manages the change from https://domain to http://localhost transparently. But docker is the main driver of this capability.

Con's

* In the field there is a growing awareness that docker also has limitations. Docker images do not receieve similar efforts to keep them updated as the traditional systems. The risk of non patched vulnarabilities is higher when running a docker infrastructue. 

## Data management

A typical use case will be that a geonovum employee arrives with some shapefiles to be published. The shapefile can be deployed as part of the deployment (via github). An alternative route is to import the data into postgres. The data can then be used in various applications. Importing a shapefile into postgres requires direct connection to postgres or use the PGAdmin dump import. GeoServer (via GeoCat Bridge) has an option to upload a shapefile and import it to Postgres. See [HOWTO data](../howto/howto_database.md) on how to use both approaches.

## Run infra locally

The current deployment can be run locally on Linux and Mac easily, which is helpfull to test a new development before creating the Pull Request. However it may be the case that this does not easily work on Windows. On the other hand, maybe this is not a scenario, because the GeoNovum employee might update the configuration in git, and deploy it to the test environment, and use that as a test prior to moving the configuration to the production system.

## Use of attached storage

Using attached storage is common for larger files with a focus on read access. Can we use it to store grids (tiff) or tile cache to make it accessible for various services? Using attached storage as backend for geopackage or postgres is not optimal on attached storage because of many concurrent requests and file locking. Attached storage is usefull for bulk downloads (inspire stored query). Read access to a tilecache can be usefull, but seeding is problematic, due to the number of write requests.

## Load balancing
Current setup does not have scaling (it is possible using traeffik, but currently not set up). It could be relevant to set up load balancing, at some point because it has its own type of challenges.

Auto scaling as provided by for example Kubernetes, is not in scope for this experiment. Kubernetes generally requires a large hosting farm, such as azure, google.

## Include geoserver in the experiment?

We had some discussion if we should include GeoServer in the experiment. GeoServer is known to have challenges in cloud environments (memory usage, stability). But it is not explicitely known which challenges those are, and if their are ways to move around them. That's why it is usefull to include it. Also because the software has a high adoption at Dutch data providers.

An aspect of GeoServer challenges in cloud is the complexity of its config files. The config files are designed around the web user interface which is commonly used to set them up, and heavily depends on relations identified by complex uuid strings. Running multiple geoservers along side requires to synchronise the config files over the instances. This gets extra challenging in case

GeoServer has a jdbcconfig community module which allows to store the configuration in a database. But that plugin is not an official status yet (low TRL). Initiatives exist to define a geoserver cloud native strategy, based around an event bus.

## URL configuration

Products tend to include a configuration parameter to indicate the outside url in which the service is made available. This url is for example used in a getcapabilities response to indicate the endpoint of the service. In CI/CD environments this parameter is challenging, because it may vary based on how you access the service (via internal or remote). There is actually no need to persist this in a parameter, because the value is also provided by the x-forwarded-for header of the request. Mind that the gateway software should be set up to add the x-forwarded-for header to the request. GeoServer facilitates for example this use case, in the settings you can activate a setting: 'use header for proxy url'.

Traeffik caused additional challenges for the CSRF token check in geoserver. Seems you have to whitelist the proxy domain or disable csrf check at all (our choice). CSRF support has been added to recent geoserver versions, it offers an additional protection against script attacks.

## Log handling

To set up a proper mechanism to persist and visualise (error) logs is an important aspect of a successfull SDI implementation. Logs can be evaluated to find the cause of a problem, or more general find aspects to improve on the implementation. 3 types of logs can be identified:

- Error logs (generated by the application)
- Usage logs (typically at the gateway level)
- (un)availability (and hardware monitoring)

Important aspects to evaluate is to prevent log files to grow to unexpected size and not get destructed at redeployment. Setting up proper log rotation is key. Another aspect to consider is that log files have a GDPR (AVG) aspect. Access logs typically persist ip adresses of endusers.

### Error logs

Within Docker it is a convention to report errors via stdout, so they are picked up by docker. LDProxy needs a dedicated configuration to set up logging to stdout.

Tools like logstash are able to persist the logs from docker and visualise it in kibana. We have not implemented a central collection of error logs. Instead we delegate to [portainer](/portainer) for viewing logs.

### Usage logs

Traeffik needs to be set up to direct access-logs to a channel. A very basic option to persist and vizualise these logs is AWStats. More advanced tools are capable to cluster groups of requests, for example all requests within a certain bounding box or feature type.

### Availability logs

Various generic products exist such as pingdom, checkmk, zabbix, nagios. Cloud platforms such as kubernetes have embedded systems. A dedicated product exists for the geospatial world, called GeoHealthCheck. It monitors the availability (and to a degree the complience) of gis layers. (see [HOWTO ghc](../howto/howto_ghc.md) on how to use it)

## Backup

Backup (or synchronisation) should be set up for volatile data, such as databases and log files. These aspects are less relevant to this infrastructure, because we persist all configuration in GitHub and loss of the log files is not very critical. We therefore have not set up any backups or data synchronisation. 