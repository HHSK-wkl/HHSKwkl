# Nederlandse labels voor Datatable

Deze functie stelt in
[`base::options()`](https://rdrr.io/r/base/options.html) een aantal
opties in die zorgen voor Nederlandse labels bij het gebruik van
DT::datatable

## Usage

``` r
dt_labels_nederlands()
```

## Value

Aanpassing in [`base::options()`](https://rdrr.io/r/base/options.html)

## Examples

``` r
dt_labels_nederlands
#> function () 
#> {
#>     options(DT.options = list(language = list(paginate = list(previous = "Vorige", 
#>         `next` = "Volgende"), search = "Zoeken", decimal = ",", 
#>         info = "Rijen _START_ tot _END_ | Totaal: _TOTAL_ rijen", 
#>         lengthMenu = "Toon _MENU_ rijen")))
#> }
#> <bytecode: 0x5649ccc983c0>
#> <environment: namespace:HHSKwkl>
```
