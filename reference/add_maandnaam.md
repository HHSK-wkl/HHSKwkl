# Toevoegen van de maandnaam

Deze functie voegt de Nederlandse naam van een maand toe aan een
dataframe op basis van de datum

## Usage

``` r
add_maandnaam(df, datum = "datum", titlecase = FALSE)
```

## Arguments

- df:

  Dataframe waar een kolom maandnaam aan wordt toegevoegd

- datum:

  Character met de naam van de datum kolom. De default is `"datum"`

- titlecase:

  Logical. Maandnamen met hoofdletter of niet

## Value

Een dataframe met de nieuwe kolom `maandnaam`

## Examples

``` r
if (FALSE) { # \dontrun{

dataframe <- add_maandnaam(dataframe_orig)
dataframe %>% add_maandnaam()
dataframe %>% add_maandnaam(datum = "mijn_datumkolom", titlecase = FALSE)
} # }
```
