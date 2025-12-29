# Download data van FTP-server

Download data van FTP-server

## Usage

``` r
download_data(files, destination = "data", url = NULL)
```

## Arguments

- files:

  Een character-vector met bestandsnamen

- destination:

  Map waar de data opgeslagen moet worden.

- url:

  URL van de FTP-server

## Value

Databestanden op de gekozen locatie.

## Examples

``` r
if (FALSE) { # \dontrun{
download_data(c("fys_chem.rds", "meetpunten.rds"))
} # }
```
