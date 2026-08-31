# Leaflet basiskaart met topo en luchtfoto

Deze functie genereert een basiskaart in leaflet. Aan deze kaart kunnen
vervolgens vrij elementen worden toegevoegd

## Usage

``` r
basiskaart(data = NULL, type = c("osm", "cartolight"), api_key = NULL, ...)
```

## Arguments

- data:

  Een optioneel dataframe. Zie ook het data-argument in de functie
  [`leaflet::leaflet()`](https://rstudio.github.io/leaflet/reference/leaflet.html)

- type:

  Het type kaart. Opties zijn `"osm"` (default) en `"cartolight"`

- api_key:

  API key voor Carto achtergrond. Zonder key krijgt de achtergrond een
  watermerk. Indien NULL wordt `Sys.getenv("API_KEY_CARTO")`
  geraadpleegd.

- ...:

  Named arguments voor `leaflet()`

## Value

Een leaflet kaart

## Examples

``` r

basiskaart()

{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap",null,"Kaart",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addProviderTiles","args":["Esri.WorldImagery",null,"Luchtfoto",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addLayersControl","args":[["Kaart","Luchtfoto"],[],{"collapsed":false,"autoZIndex":true,"position":"topleft"}]}]},"evals":[],"jsHooks":[]}
```
