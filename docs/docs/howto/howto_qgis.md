---
title: HOWTO QGIS server
---

# HOWTO QGIS server

QGIS server is configured through QGIS Desktop. The project file generated with QGIS is then uploaded to the server (along with any data to serve).

- Start a new project in QGIS, or update an existing.
- Add the relevant layers to the project. For file based data, place the files in (or under) the folder where the project is stored, else QGIS may generate unresolvable paths in the project file.
- If you want to use a database layer, upload any data to the remote PostGreSQL. Connect your local QGIS to the remote database and add the PostGreSQL tables as layers to the project.
- Go to Project Properties, open the QGIS Server tab, fill in relevant fields. Make sure to check the "publish" checkbox in the WFS section, else no collections will be available.
- Save the project as .qgs file (not .qgz) and push it to Github with all related files.
- The project should be called project.qgs. Alternatively you can set an environment variable 

```
QGIS_PROJECT_FILE:/etc/qgisserver/my-new-project.qgs
```

- Test your service via https://apitestbed.geonovum.nl/qgis/wfs3



