# Relative count - fractions

Relative count - fractions

## Usage

``` r
count_rel(x, ..., sort = FALSE, name = "frac")
```

## Arguments

- x:

  a `tbl()` to count.

- ...:

  Variables to group by.

- sort:

  if TRUE will sort output in descending order of n

- name:

  The output column name. If omitted, it will be n.

## Value

A tbl with fractions, grouped the same way as x.

## Examples

``` r
count_rel(mtcars, cyl, sort = TRUE)
#>   cyl    frac
#> 1   8 0.43750
#> 2   4 0.34375
#> 3   6 0.21875
count_rel(mtcars, cyl)
#>   cyl    frac
#> 1   4 0.34375
#> 2   6 0.21875
#> 3   8 0.43750
```
