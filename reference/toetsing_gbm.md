# Toetsing gewasbeschermingsmiddelen

Deze functie toetst per jaar per gewasbeschermingsmiddel of er een
overschrijding is en hoe groot deze is. Als er in een jaar meerdere
detectiegrenzen zijn wordt de laagste detectiegrens gebruikt.

## Usage

``` r
toetsing_gbm(data, normen, factor_detectiegrens = 0.5)
```

## Arguments

- data:

  Een dataframe met data

- normen:

  Een dataframe met normen

- factor_detectiegrens:

  Te gebruiken factor voor detectiegrenswaarden. Default is 0.5.

## Value

Een dataframe met per meetpunt, parameter en jaar een toetsing. De
toetsing bestaat uit:

- `aangetroffen` - Logical. Of het gewasbeschermingsmiddel is
  aangetroffen of niet

- `overschrijding` - Logical. Of er een normoverschrijding geconstateerd
  is of niet

- `hoogste_overschrijding` - De maximale (overschrijdings)factor

- `factor_MAX` - De (overschrijdings)factor voor de Maximaal Aanvaarbare
  Concentratie - MAC

- `facor_JGM` - De (overschrijdings)factor voor de jaargemiddelde
  concentratie - JGM

- `factor_P90` - De (overschrijdings)factor voor de
  90-percentielwaarde - P90

## Examples

``` r
if (FALSE) { # \dontrun{

toetsing <- toetsing_gbm(mijn_data, normen)
} # }
```
