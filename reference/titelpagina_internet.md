# Titelpagina voor de grafieken op internet

Creeert een titelpagina voor grafieken zoals deze worden geproduceerd
met
[grafiek_basis](https://hhsk-wkl.github.io/HHSKwkl/reference/grafiek_basis.md).
Dient gebruikt te worden binnen een graphic device (bijvoorbeeld
[`pdf()`](https://rdrr.io/r/grDevices/pdf.html)).

## Usage

``` r
titelpagina_internet(inclusief_normen = TRUE)
```

## Arguments

- inclusief_normen:

  logical Bepaald of de lijnen met normen op de titelpagina worden
  weergegeven. Default is `TRUE`

## Value

Een titelpagina voor de grafieken

## Examples

``` r
if (FALSE) { # \dontrun{

pdf("mijntest.pdf", width = 16, height = 8)
titelpagina_internet()
print(basisgrafiek)
dev.off()
} # }
```
