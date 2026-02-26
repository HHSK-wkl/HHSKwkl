# Bepaal macrofaunagroep

Deze functie bepaalt de groep waartoe een macrofaunataxon behoort, De
indeling is gebaseerd op het werk van de trainee Jildau Kuiper.

## Usage

``` r
macev_groep(naam)
```

## Arguments

- naam:

  Naam van een taxon. Als het taxon ontbreekt of niet gevonden wordt dan
  is het resultaat `"Overig"`

## Value

Een vector met de groepsnamen

## Examples

``` r
macev_groep(c("Faxonius", "Procambarus", "TEST", NA))
#> [1] "Tienpotigen (kreeften)" "Tienpotigen (kreeften)" "Overig"                
#> [4] "Overig"                
```
