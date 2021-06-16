---
title: API Strategie Findings
---

# API Strategie Findings

The knowledge Platform API's has published a normative document on [REST-API design rules](https://publicatie.centrumvoorstandaarden.nl/api/adr/). This document explains how you can set up an OGC API service respecting these rules.

| ID | Aspect | Comment |
| --- | --- | --- |
| API-01 | Adhere to HTTP safety and idempotency semantics for operations | |
| API-02 | Do not maintain session state on the server | |
| API-03 | Only apply standard HTTP methods | |
| API-04 | Define interfaces in Dutch unless there is an official English glossary available | |
| API-05 | Use nouns to name resources | Collections and items are user by name |
| API-06 | Use nested URIs for child resources | Items are children of collections |
| API-10 | Model resource operations as a sub-resource or dedicated resource | |
| API-16 | Use OpenAPI Specification for documentation | |
| API-17 | Publish documentation in Dutch unless there is existing documentation in English | |
| API-18 | Include a deprecation schedule when publishing API changes | |
| API-19 | Schedule a fixed transition period for a new major API version | |
| API-20 | Include the major version number in the URI | |
| API-48 | Leave off trailing slashes from URIs | |
| API-51 | Publish OAS document at a standard location in JSON-format | |
| API-53 | Hide irrelevant implementation details | |
| API-54 | Use plural nouns to name collection resources | |
| API-55 | Publish a changelog for API changes between versions | |
| API-56 | Adhere to the Semantic Versioning model when releasing API changes | |
| API-57 | Return the full version number in a response header | |