# Bepaal welk aandeel voldoet aan een voorwaarde

Deze functie kan binnen
[summarise](https://dplyr.tidyverse.org/reference/summarise.html) worden
gebruikt om te bepalen welk aandeel voldoet aan een bepaalde voorwaarde.

## Usage

``` r
frac(condition)

perc(condition)
```

## Arguments

- condition:

  Logical. Een voorwaarde waarvan wordt bepaald welk aandeel eraan
  voldoet.

## Value

Fractie of percentage dat voldoet aan de voorwaarde

## Examples

``` r
dplyr::summarise(mtcars, 
                 frac_4_cyls = frac(cyl == 4),
                 perc_6_cyls = perc(cyl == 6))
#>   frac_4_cyls perc_6_cyls
#> 1     0.34375      21.875
```
