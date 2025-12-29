# Jaar en maand toevoegen

Voeg kolommen toe met het jaar en/of de maand op basis van de datum. De
datumkolom moet een datumformaat hebben.

## Usage

``` r
add_jaar_maand(df, datum = "datum")

add_jaar(df, datum = "datum")

add_maand(df, datum = "datum")
```

## Arguments

- df:

  Een dataframe waar de kolommen aan toegevoegd moeten worden.

- datum:

  Een character-string met naam van de datum kolom. Default is `"datum"`

## Value

De dataframe met een extra kolom `jaar` en/of `maand`. Beide kolommen
zijn integers.

## Functions

- `add_jaar_maand()`: Voeg twee kolommen toe met het jaar en de maand.

- `add_jaar()`: Voeg een kolom toe met het jaar.

- `add_maand()`: Voeg een kolom toe met de maand.

## Examples

``` r
if (FALSE) { # \dontrun{

data %>% add_jaar_maand()

data %>% add_jaar()

data %>% add_maand()
} # }
```
