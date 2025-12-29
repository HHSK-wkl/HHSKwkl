# Maak grafieken voor het internet

Deze functie maakt per meetpunt een pdf-document met een grafiek voor
elke parameter.

## Usage

``` r
grafieken_internet(
  data,
  meetpuntendf,
  parameterdf,
  normen,
  plot_normen = TRUE,
  export_pad = "export/grafieken",
  lijst_parnrs = NULL,
  min_aantal_waarden = 12,
  grafiekenfunctie = grafiek_basis
)
```

## Arguments

- data:

  Een dataframe met ruwe gegevens om grafieken van te maken. Deze moet
  tenminste de kolommen mp, parnr, datum, detectiegrens en waarde
  hebben.

- meetpuntendf:

  Een dataframe met mp en mpomsch voor de titel van de grafiek.

- parameterdf:

  Een dataframe met parnr eenheid en parnaamlang voor de titel van de
  grafiek.

- normen:

  Een dataframe met de normen.

- plot_normen:

  Logical. Switch om wel geen normen te plotten. Default is `TRUE`

- export_pad:

  String. Locatie waar de pdf's geplaatst worden

- lijst_parnrs:

  Een optionele vector met parameternummers die meegenomen worden.

- min_aantal_waarden:

  Het minimale aantal waarnemingen wat vereist is voor een grafiek

- grafiekenfunctie:

  Het is mogelijk om een alternatieve functie op te geven om de
  grafieken te maken. De default is
  [`grafiek_basis()`](https://hhsk-wkl.github.io/HHSKwkl/reference/grafiek_basis.md)

## Value

Per meetpunt in `data` een pdf-document met per parameter een grafiek

## Examples

``` r
if (FALSE) { # \dontrun{

grafieken_internet(data, meetpuntendf, parameterdf, normen, export_pad = "TEST/GRAF")

} # }
```
