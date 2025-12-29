# Tijdreeksgrafiek

Deze functie maakt een tijdreeksgrafiek van 1 meetpunt van 1 parameter.

## Usage

``` r
grafiek_basis(
  data,
  mp = NULL,
  mpomsch = NULL,
  parnaam = NULL,
  eenheid = NULL,
  plot_loess = TRUE
)
```

## Arguments

- data:

  Een dataframe met de gegevens van 1 tijdreeks, dus van 1 meetpunt en 1
  parameter. `data` moet tenminste een kolom `datum`, `detectiegrens` en
  een kolom `waarde` hebben.

- mp:

  Code van het meetpunt. Deze wordt gebruikt in de titel

- mpomsch:

  Omschrijving van het meetpunt. Deze wordt gebruikt in de titel

- parnaam:

  Naam van de parameter. Deze wordt gebruikt in de ondertitel

- eenheid:

  Eenheid van de parameter. Deze wordt gebruikt als titel van de Y-as

- plot_loess:

  Wel of niet plotten van een LOESS-curve. Default is TRUE

## Value

Een ggplot grafiek. Het is mogelijk om achteraf andere ggplot objecten
toe te voegen met `+`

## Examples

``` r
if (FALSE) { # \dontrun{

## ERROR

} # }
```
