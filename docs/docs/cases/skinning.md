---
title: Skinning OGC API Features
---

# Skinning OGC API Features

HTML is a first class citizen in OGC API Common. This means that a typical OGC API can be accessed via a web browser, offering a human readable interface. This aspect brings in a usability aspect that providers previously didn't need to worry about. Aspects such as corporate identity, WCAG, cookie/privacy statement.

For the experiment we need to understand how easy it is to update basic aspects on the html visualisation in the various products.

## pygeoapi

pygeoapi uses [jinja templates](https://palletsprojects.com/p/jinja/) for html output. These templates are located at https://github.com/geopython/pygeoapi/tree/master/pygeoapi/templates. You can override these templates at their location. But you can also [set a separate template override folder](https://github.com/geopython/pygeoapi/blob/37b1e9553b29b168b7d5637cc45974ac2681a75f/pygeoapi-config.yml#L45-L46), where you can place (a part of the) updated tamplates. Updating the templates requires basic html skills, subsituted parameters are placed in curly braces:


```html
<footer class="sticky">Powered by <a title="pygeoapi" href="https://pygeoapi.io">
  <img src="{{ config['server']['url'] }}/static/img/pygeoapi.png" title="pygeoapi logo" style="height:24px;vertical-align: middle;"/>
  </a> {{ version }}
</footer> 
```

## pycsw

The implementation of OGC API Records in pycsw is derived from the pygeoapi implementation (same group). The templates are located at `~/pycsw/ogc/api/templates`.

## QGIS

QGIS uses similar jinja templates as pygeoapi, you can override the resources folder via the environment variable QGIS_SERVER_API_RESOURCES_DIRECTORY. The standard location of the templates is `~/qgis/resources/server/api/ogc/templates/wfs3`.

## GeoServer

GeoServer uses [Freemarker templates](https://freemarker.apache.org/) to render content in html. These `.ftl` files are persisted within `.jar` files. A basic step could be to extract the gs-ogcapi-features.jar file to a folder, adjust the templates, and zip the package back to a jar file and deploy it. I'm currently not aware of a overriding mechanism. Freemarker uses a similar mechanism as jinja:

```html
<li>Mail: <a href="mailto:${contact.contactEmail}">${contact.contactEmail}</a></li>
```

## LDProxy

The HTML encoding is implemented using [Mustache templates](https://mustache.github.io/). Custom templates are supported, they have to reside in the data directory under the relative path `templates/html/{templateName}.mustache`, where `{templateName}` equals the name of a default template (see [source code](https://github.com/search?q=repo%3Ainteractive-instruments%2Fldproxy+extension%3Amustache&type=Code) on GitHub) (taken from [ldproxy docs](https://github.com/interactive-instruments/ldproxy/blob/fb772a7c3bc9b32cdde06a1ac92bbb72414b07d1/docs/en/configuration/services/building-blocks/html.md#customization)).