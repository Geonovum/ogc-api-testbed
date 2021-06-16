---
title: HOWTO INSPIRE & pygeoapi
---

# HOWTO INSPIRE & pygeoapi

This HOWTO describes how to set up an INSPIRE service in pygeoapi for a Dutch INSPIRE dataset, [Beschermde Gebieden - Cultuur Historie](https://www.nationaalgeoregister.nl/geonetwork/srv/dut/catalog.search#/metadata/493ab81b-75f8-4205-b030-6b2fd9eb4295), which is exposed via a [Atom download service](https://www.nationaalgeoregister.nl/geonetwork/srv/dut/catalog.search#/metadata/0080a9ce-b836-45bc-8fdf-07dcbe97101d).

pygeoapi is configured using a config file. In this config file you have to add configuration for the inspire dataset. Note that one service provides access to a single dataset (having one or more feature types).

Before starting verify if:

- Data is in a single language or multilingual
- Data is harmonised or as-is


