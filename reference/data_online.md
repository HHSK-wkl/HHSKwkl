# Download en lees een online RDS-bestand

Deze functie download een .rds bestand van de FTP-server en leest het
in.

## Usage

``` r
data_online(file, url = NULL)
```

## Arguments

- file:

  Bestandsnaam van het rds bestand om te downloaden en in te lezen.

- url:

  URL van de bronlocatie. Default is de FTP-server van HHSK

## Value

Een R-object

## Examples

``` r
if (FALSE) { # \dontrun{
fys_chem <- data_online("fys_chem.rds")
} # }
```
