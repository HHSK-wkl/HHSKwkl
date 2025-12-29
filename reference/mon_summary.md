# Samenvatting monster

Deze functie maakt een samenvatting van een monster. Hiermee is het
mogelijk om snel een overzicht van een monster te krijgen en eventuele
problemen te constateren.

Het is mogelijk om meerdere monsters tegelijk samen te vatten door
gebruik van de functie
[dplyr::group_by](https://dplyr.tidyverse.org/reference/group_by.html)

## Usage

``` r
mon_summary(df, naam = naam, waarde = waarde)
```

## Arguments

- df:

  Een (grouped) dataframe met een of meerdere monsters

- naam:

  De kolomnaam met de taxonnamen. Dit argument wordt gequote.

- waarde:

  De kolomnaam met de waarden. Dit argument wordt gequote.

## Value

DUMMY

## Examples

``` r
#DUMMY
```
