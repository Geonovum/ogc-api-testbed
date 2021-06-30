---
title: HOWTO GeoHealthCheck
---

# HOWTO GeoHealthCheck

[GeoHealthCheck](https://geohealthcheck.org) (GHC)
provides a monitoring service which indicates availability and compliance to the 
OGC API Features (OAFeat) standard.

## GHC Model

You may want to browse the [GHC Presentation Slides](https://geohealthcheck.org/presentation/index.html#/)
to get an idea what GHC is about.

The GHC conceptual model comprises the entities *Resources*, *Probes* and *Checks*.

* *Resource* : basically the (URL) access/endpoint of your service instance. Example: a *WMS Endpoint*
* *Probe* : action(s) performed on a *Resource*, for example a *WMS GetMap* request
* *Checks*: test results/responses of a *Probe*: *Is the GetMap result an image?*
 
In the GHC UI you will manage these three entities.

## Add Monitoring for a Service

- navigate to the GHC page e.g. [apitestbed.geonovum.nl/ghc/](https://apitestbed.geonovum.nl/ghc/)
- Login 
- Click button upper right called *Add+*
- Select *"OGC API Features (OAFeat)"* Resource Type
- Add your full endpoint URL
  
This brings you into the Resource Editor for your newly registered service endpoint (called a *GHC Resource*).
By default, each new Resource gets a "Capabilities Probe" assigned which 
checks the overall health of your endpoint ("does it provide a valid Capabilities/OAS file?")
In the editor you can set various parameters and additional "Probes" and "Checks".

Be sure to have at least the following two Probes active:

* **OGC API Features (OAFeat) Capabilities** - Validates OAFeat endpoint landing page	 
* **OGC API Features (OAFeat) Drilldown** - Traverses all Collections in the endpoint validating if Features are returned 

The **OGC API Features (OAFeat) OpenAPI Validator** does a complete OAS3 JSON Schema validation on your OAS3 Endpoint JSON document.
Most OAFeat implementations, except `pygeoapi` and `ldproxy` (as on June 30, 2021), fail this Probe.
