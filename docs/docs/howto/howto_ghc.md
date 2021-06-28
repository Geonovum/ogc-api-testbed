---
title: HOWTO GeoHealthCheck
---

# HOWTO GeoHealthCheck

[GeoHealthCheck](https://geohealthcheck.org) (GHC)
provides a monitoring service which indicates availability and compliance to the 
OGC API Features (OAFeat) standard.
You may want to browse the [GHC Presentation Slides](https://geohealthcheck.org/presentation/index.html#/)
to get an idea what GHC is about.

## Add Monitoring for a Service

- navigate to the GHC page e.g. [apitestbed.geonovum.nl/ghc/](https://apitestbed.geonovum.nl/ghc/)
- Login 
- Click button upper right called *Add+*
- Select *"OGC API Features (OAFeat)"* Resource type
- Add your fill endpoint URL
  
This brings you into the editor for your newly registered service endpoint (called a *GHC Resource*).
By default, each new Resource gets a "Capabilities Probe" assigned which 
checks the overall health of your endpoint ("does it provide a valid Capabilities/OAS file?")
In the editor you can set various parameters and additional "Probes" and "Checks".

Be sure to have at least the following two Probes active:

* **OGC API Features (OAFeat) Capabilities** - Validates OAFeat endpoint landing page	 
* **OGC API Features (OAFeat) Drilldown** - Traverses all Collections in the endpoint validating if Features are returned 

The **OGC API Features (OAFeat) OpenAPI Validator** can also be assigned but 
most implementations fail on this. This Probe does a complete OAS3 JSON Schema validation on
your OAS3 Endpoint JSON document.
