# Zoek een waarde op in een opzoektabel

Deze functie kan waarden opzoeken in een tabel. Het is het alternatief
voor een hash table, die R helaas niet heeft.

## Usage

``` r
opzoeken_waarde(sleutel, df, attribuut, sleutelkolom = 1)
```

## Arguments

- sleutel:

  De sleutelwaarde, selecteert de rij

- df:

  Een dataframe die functioneert als opzoektabel

- attribuut:

  De kolom(index) waar de op te halen waarde staat

- sleutelkolom:

  Optioneel - de kolom(index) als character of integer. Standaard staat
  de eerste kolom als sleutelkolom ingesteld

## Value

De waarde die te vinden is op de betreffende rij of kolom. Bij
dubbelingen in de sleutel, wordt de eerste waarde geretourneerd.

## Examples

``` r
if (FALSE) { # \dontrun{

meetpuntomschrijving <- ophalen_waarde(sleutel = "00016", df = meetpuntendf, attribuut = "mpomsch")

} # }
```
