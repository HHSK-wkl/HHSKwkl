# Maak en voeg RIVM-normlijnen toe aan een plot

De functie `norm_lijnen` vertaalt de normen behorend bij een bepaald
parameternummer in normlijnen die toegevoegd kunnen worden aan een plot.
De functie `add_norm_lijnen` voegt ze toe aan het plot.

## Usage

``` r
norm_lijnen(parnr, normen)

add_norm_lijnen(plot, parnr, normen)
```

## Arguments

- parnr:

  Het nummer van de parameter waar de normen van toegevoegd moeten
  worden

- normen:

  Een dataframe met de normen

- plot:

  Het plot waar de normlijnen aan toegevoegd moeten worden

## Value

een geom-object met normen dat toegevoegd kan worden aan een plot, of
een plot waar deze aan toegevoegd zijn.

## Functions

- `norm_lijnen()`: Creeer normlijnen die aan een plot toegevoegd kunnen
  worden

- `add_norm_lijnen()`: Voeg normlijnen toe aan een bestaand plot

## Examples

``` r
if (FALSE) { # \dontrun{

norm_lijnen_object <- norm_lijnen(parnr = 1000, normen = normen)
plot_met_normen <- plot + norm_lijnen_object

plot_met_normen <- add_norm_lijnen(plot, parnr = 1000, normen = normen )

plot %>% add_norm_lijnen(parnr = 1000, normen = normen)

} # }
```
