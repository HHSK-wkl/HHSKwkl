# Synchroniseer bestanden met een bronlocatie

Deze functie is bedoeld om data van een centrale locatie te
synchroniseren met een projectmap.

## Usage

``` r
copy_data(filenames = NULL, origin, destination = "data")
```

## Arguments

- filenames:

  Vector of lijst met bestanden. Als deze leeg blijft worden alle
  bestanden uit `origin` gekopieerd.

- origin:

  Bronlocatie.

- destination:

  Doellocatie. Default is `"data"`

## Value

Synchronisatie van bestanden van de bronlocatie met de doellocatie.

## Examples

``` r
if (FALSE) { # \dontrun{

copy_data()
copy_data("fys_chem.csv")
copy_data("fys_chem.csv", origin = "P:/Dawaco/FME", destination = "data")
} # }


```
