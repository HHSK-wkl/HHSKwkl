library(readr)
library(dplyr)
library(stringr)
library(png)
library(colorspace)


hhskgroen <- "#8dc63f"

hhskblauw <- "#0079c2"

logo <- readPNG("data-raw/logo website.png") %>% as.raster()

schonevoeten <- readPNG("data-raw/schonevoeten.png") %>% as.raster()

my_CRS <- "+init=EPSG:28992"

usethis::use_data(my_CRS, hhskgroen, hhskblauw, logo, schonevoeten)

blauw    <- hex(HLS(202.5, 0.38, 1))
blauw_m  <- hex(HLS(202.5, 0.60, 1))
blauw_l  <- hex(HLS(202.5, 0.80, 1))
oranje   <- hex(HLS(25   , 0.38, 1))
oranje_m <- hex(HLS(25   , 0.60, 1))
oranje_l <- hex(HLS(25   , 0.80, 1))
grijs    <- "#616161"
grijs_m  <- "#999999"
grijs_l  <- "#cccccc"

# c(blauw, blauw_m, blauw_l, oranje, oranje_m, oranje_l, grijs, grijs_m, grijs_l)

usethis::use_data(blauw, blauw_m, blauw_l, oranje, oranje_m, oranje_l, grijs, grijs_m, grijs_l, overwrite = TRUE)
