---
title: Extending pygeoapi
---

# Extending pygeoapi

An interesting use case around OGC API's is the ability to extend a base product with additional methods to facilitate more advanced data interaction. For example on a dataset with 'public announcements', citizens may want to interact with an announcement by sharing it with their friends, upvote or comment on it. 

Of all products in the testbed pygeoapi seems most appropriate to be extended to facilitate this use case. Unfortunately pygeoapi currently does not offer any extension points to add new methods. There is however the OGC API Processes endpoint which can be used for this purpose. Also I provide an example of an extension point in pygeoapi, to indicate how extensions are managed in pygeoapi.

## OGC API processes

OGC API processes has a similar goal, to extend interacting with datasets by offering the capability to run processes on a dataset. The advantage is that users don't need to download the data, but can interact with the data at its origin. Processes are defined server side. Which processes are available is listed in the /processes endpoint.

OGC API processes is more verbose then what people expect in modern api's. For example submitting 2 parameters to the hello-world process requires this input json object.

```json
{
  "inputs": [
    {
      "id": "name",
      "type": "text/plain",
      "value": "World"
    },
    {
      "id": "message",
      "type": "text/plain",
      "value": "An optional message."
    }
  ]
}
```

Above data structure facilitates quite complex input parameters and is well described in the open api document. An important benefit is that this is a standadised client-server interaction. Both synchronous and asynchronous cases are supported by OGC API Processes.

[Read more](https://docs.pygeoapi.io/en/latest/data-publishing/ogcapi-processes.html?highlight=processes) on how processes can be defined in pygeoapi

## Extending pygeoapi

pygeoapi has been developed with the idea of running it standalone or as a library in for example GeoNode. The optimal way to extend pygeoapi is to create a dedicated project and add pygeoapi as a dependency to the project. Extending pygeoapi is currently most common in the provider section. Users are invited to write their own providr plugin which manages access to a dedicated backend.

An example of this is https://github.com/Canadian-Geospatial-Platform/geocore-pygeoapi. The project is a provider plugin to access a dedicated spatial catalogue backend in order to provide an OGC API Records layer by pygeoapi. The project includes pygeoapi as a depenendy (via [requirements.txt](https://github.com/Canadian-Geospatial-Platform/geocore-pygeoapi/blob/88162b8f4558751eb4d85e9fa48d60b0ed1e4ad6/requirements.txt#L1)).


