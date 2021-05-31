# Home

This is a placeholder for upcoming full documentation.

See the [project README on GitHub](https://github.com/Geonovum/ogc-api-testbed/blob/main/README.md)
for how this testbed is setup.

## Sandbox and stable environment
The sandbox environment is intended to play with the services: create and deploy an API. For example, to create and deploy an API with pygeoapi. Deployed services on the sandbox are not intended to be used by others for other purposes than testing. They could be removed or changed any time, without notice.

The stable environment is intended for demo APIs (and other services) that should be available for the public. For example to show results, or for third parties to use in other tests. Still no full production environment, or guaranteed availability. But onlye a few maintainers are able to change or remove services deployed to this environment.

## HowTos

There are several how to's, for the sandbox environment:

1. [create and deploy a base API](howtos_sandbox.md)
1. [create and deploy INSPIRE compliant API (pygeoapi)](howtos_sandbox.md)
1. [removing an API from the sandbox](management_services.md)

Specific for administrators of the stable environment:

1. [management of the stable environment](management_services.md)

## Findings on installation
See [installation_findings.md](installation_findings.md)

## Services

These are the services running on this domain.

* [pygeoapi](/pygeoapi) - `pygeoapi` experimental
* [ldproxy](/ldproxy) - `ldproxy` 

## Tech docs environment
See the [GitHub repo](https://github.com/Geonovum/ogc-api-testbed) for code and docs about the setup of the environment itself.

## Links

* [Project GitHub Repo](https://github.com/Geonovum/ogc-api-testbed)
* [Geonovum](https://geonovum.nl) - Geonovum home
* [pygeoapi](https://pygeoapi.io) - `pygeoapi` project home
* [ldproxy](https://github.com/interactive-instruments/ldproxy) - `ldproxy` project home
