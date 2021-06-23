---
title: HOWTO adjust the looks of OGC API Features
---

# HOWTO adjust the looks of OGC API Features

Tutorials on how to change the look and feel of OGC API features.

## GeoServer

This toturial updates the main headr and footer of GeoServer OGC API Features, [other templates](https://docs.geoserver.org/latest/en/user/community/ogc-api/features/index.html#service-configuration) can be overridden in a similar way.

- In the data directory which is mounted into geoserver add files [templates/ogc/features/common-header.ftl](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/geoserver/data/templates/ogc/features/common-header.ftl) and [templates/ogc/features/common-footer.ftl](https://github.com/Geonovum/ogc-api-testbed/blob/main/services/geoserver/data/templates/ogc/features/common-footer.ftl)
- Adjust the files to your needs and push the changes to github
- Tip, you can preview your changes without updating the platform by adjusting the html and css directly in the web page with the browser developer panel (F12)



