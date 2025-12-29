# Toevoegen van latidute en longitude

De functie voegt de latitude (Y) en longitude (X) aan een dataframe op
basis van coordinaten. Default is van RD-stelsel (EPSG = 28992) naar
WGS84 (EPSG = 4326)

## Usage

``` r
add_lat_long(
  df,
  x_coord = "x",
  y_coord = "y",
  source_crs = 28992,
  goal_crs = 4326
)
```

## Arguments

- df:

  Dataframe met coordinaten

- x_coord:

  Tekst - Kolom met de x-coordinaat

- y_coord:

  Tekst - Kolom met de y-coordinaat

- source_crs:

  Coordinaten Referentie Systeem van de broncoordinaten: als integer met
  EPSG-code of als proj4string.

- goal_crs:

  Coordinaten Referentie Systeem van de doelcoordinaten: als integer met
  EPSG-code of als proj4string.

## Value

Geeft hetzelfde dataframe met een kolom long en lat toegevoegd.

## Examples

``` r
if (FALSE) { # \dontrun{

df %>% add_lat_long()
df %>% add_lat_long(x_coord = "my_x_column", y = "my_y_column")

} # }
```
