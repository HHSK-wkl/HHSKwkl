# Bereken PAF voor bestrijdingsmiddelen

Functie voor het berekenen van potentieel aangetaste fractie obv de data
van de toxiciteitstool van ESF 8 Toxiciteit versie 2.

## Usage

``` r
paf_gbm(
  aquo_par,
  concentratie,
  detectiegrens,
  ssd_data,
  type_paf = c("acuut", "chronisch"),
  digits = NULL
)
```

## Source

De toxiciteitsdata komen uit de
[toxiciteitstool](https://rivm.shinyapps.io/chemie-tool-in-shiny/).
Documentatie is te vinden op de [website van ESF 8
Toxiciteit](https://kiwk-tox.netlify.app/nl/chemie-tool-rekentool/)

## Arguments

- aquo_par:

  Parameternaam volgens de aquonaamgeving

- concentratie:

  Concentratie in ug/l

- detectiegrens:

  Detectiegrens. NA als geen detectiegrens (NB TRUE FALSE zou logischer
  zijn)

- ssd_data:

  SSD data volgens het format van de toxiciteitstool

- type_paf:

  `"acuut"` of `"chronisch"`

- digits:

  `NULL` of het aantal decimalen om de paf af te ronden

## Value

Een vector met PAF waarden

## Examples

``` r
if (FALSE) { # \dontrun{
testdata %>% 
mutate(paf_acuut = paf_gbm(aquo_par = f_aquopar(parnr), 
                           concentratie = waarde, 
                           detectiegrens = detectiegrens,
                           ssd_data = tox, type_paf = "acuut"),
       paf_chronisch = paf_gbm(aquo_par = f_aquopar(parnr), 
                               concentratie = waarde, 
                               detectiegrens = detectiegrens,
                               ssd_data = tox, type_paf = "chronisch", digits = 5))

} # }
```
