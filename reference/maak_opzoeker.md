# Maak een opzoekfunctie

Deze functie maakt opzoekfuncties waarmee een waarde op basis van een
sleutel opgezocht kan worden.

## Usage

``` r
maak_opzoeker(df, key = 1, value = 2)
```

## Arguments

- df:

  Een dataframe met de opzoekwaarden.

- key:

  De sleutelkolom om een waarde op te zoeken. Default is de eerste
  kolom.

- value:

  De kolom met waarden die opgezocht moeten worden. Default is de tweede
  kolom

## Value

Een functie die gebruikt kan worden voor het opzoeken van waarden. De
functie accepteert (een vector) met namen en retourneert (een vector)
met opgezochte waarden.

## Examples

``` r
x <- USArrests
x$names <- rownames(x)

urbanpop_state <- maak_opzoeker(x, key = names, value = UrbanPop)
urbanpop_state("Texas")
#> [1] 80
urbanpop_state(c("Vermont", "Texas"))
#> [1] 32 80

```
