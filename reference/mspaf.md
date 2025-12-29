# Bereken de msPAF

Berekent de msPAF door het effect van afzonderlijke PAF-waarden samen te
nemen. De msPAF berekening werkt volgens het principe van kansrekening.

## Usage

``` r
mspaf(paf_vector)
```

## Arguments

- paf_vector:

  Een vector met PAF-waarden (tussen de 0 en 1).

## Value

De msPAF

## Examples

``` r
# dobbelsteen voorbeeld
mspaf(c(1/6, 1/6))
#> [1] 0.3055556
```
