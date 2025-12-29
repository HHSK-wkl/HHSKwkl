# Boxplots per jaar

Deze functie plot een boxplot per jaar van 1 meetpunt van 1 parameter.
De functie dient eigenlijk alleen met complete meetjaren te worden
gebruikt.

## Usage

``` r
boxplot_basis(
  data,
  mp = NULL,
  mpomsch = NULL,
  parnaam = NULL,
  eenheid = NULL,
  ...
)
```

## Arguments

- data:

  Een dataframe met de gegevens van 1 tijdreeks, dus van 1 meetpunt en 1
  parameter. `data` moet tenminste een kolom `datum` en een kolom
  `waarde` hebben.

- mp:

  Code van het meetpunt. Deze wordt gebruikt in de titel

- mpomsch:

  Omschrijving van het meetpunt. Deze wordt gebruikt in de titel

- parnaam:

  Naam van de parameter. Deze wordt gebruikt in de ondertitel

- eenheid:

  Eenheid van de parameter. Deze wordt gebruikt als titel van de Y-as

- ...:

  Heeft geen functie, maar kan gebruikt worden om overbodige parameters
  te negeren

## Value

Een ggplot boxplot grafiek. Het is mogelijk om achteraf andere ggplot
objecten toe te voegen met `+`

## Examples

``` r
if (FALSE) { # \dontrun{

## ERROR

} # }
```
