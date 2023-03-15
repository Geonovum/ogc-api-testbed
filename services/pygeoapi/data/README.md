# Data for pygeoapi

This folder contains various data files.

## ADNL sets
These are INSPIRE-harmonized Addresses, originally from Dutch "BAG" (Addresses and Buildings) governmental dataset.

* ADNL.gml: delivered by WeTransform, converted with HALE. Other files are derived.
* ADNL_4326: set in EPSG:4326 made with `ogr2ogr -t_srs EPSG:4326  -s_srs EPSG:4258 -f GPKG ADNL_4326.gpkg  ADNL.gml`
* ADNL_28992: set in EPSG:28992 (Dutch national projection) made with `ogr2ogr -t_srs EPSG:28992  -s_srs EPSG:4258 -f GPKG ADNL_28992.gpkg  ADNL.gml`

## Statistical Units (SU)

* SU_NL_WGS84.gpkg: Statistical Units in WGS84

## ProtectedSites

* PSNL_WGS84.gpkg: ProtectedSites Netherlands INSPIRE Harmonized, generated from rce.gpkg, which has no CRS: `ogr2ogr -f GPKG -a_srs EPSG:4326 PSNL_WGS84.gpkg rce.gpkg`
