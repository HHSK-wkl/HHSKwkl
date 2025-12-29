# Haal Open GIS-data van HHSK op

Met deze functie kan GIS-data van HHSK worden gedownload. Voor de
beschikbare datasets zie `gisdata_info` of gebruik de interactieve
versie van de functie met `dataset = NULL`.

## Usage

``` r
get_open_gisdata(dataset = NULL)
```

## Arguments

- dataset:

  Code voor de gewenste dataset. Zie ook `gisdata_info`. `NULL` geeft
  een keuze menu.

## Value

Een geo-object met de gekozen dataset.

## Examples

``` r
if (FALSE) { # \dontrun{
get_open_gisdata("krw_2022_2027")
} # }
```
