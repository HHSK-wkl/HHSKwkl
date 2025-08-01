# library(readr)
# library(dplyr)
# library(stringr)
# library(png)
# library(colorspace)

blauw_d <-  "#293173"
blauw   <-  "#0067C6"
blauw_m <-  "#8ED4DA"
blauw_l <-  "#D2EBEE"
groen_d <-  "#015F03"
groen   <-  "#76B900"
groen_m <-  "#CBDF74"
groen_l <-  "#E7F0C0"
oranje  <-  "#F9651F"
oranje_m <- "#FFBC80"
grijs_d <-  "#4F4F4F"
grijs   <-  "#636363"
grijs_m <-  "#B5B5B5"
grijs_l <-  "#E0E0E0"
wit     <-  "#FFFFFF"
tekstgrijs <- "#222222"

kleuren_hhsk <- c(
  blauw_d  = blauw_d , 
  blauw    = blauw   ,
  blauw_m  = blauw_m ,
  blauw_l  = blauw_l ,
  groen_d  = groen_d ,
  groen    = groen   ,
  groen_m  = groen_m ,
  groen_l  = groen_l ,
  oranje   = oranje  ,
  oranje_m = oranje_m,
  grijs_d  = grijs_d ,
  grijs    = grijs   ,
  grijs_m  = grijs_m ,
  grijs_l  = grijs_l ,
  wit      = wit     ,
  tekstgrijs = tekstgrijs)

usethis::use_data(blauw, groen, oranje, grijs, wit, 
                  blauw_d, groen_d, grijs_d, 
                  blauw_m, groen_m, oranje_m, grijs_m, 
                  blauw_l, groen_l, grijs_l, 
                  tekstgrijs,
                  kleuren_hhsk,
                  overwrite = TRUE)

ws_grens_rd <- sf::st_read("data-raw/ws_grens.gpkg", crs = 28992, quiet = TRUE)
ws_grens_wgs <- sf::st_read("data-raw/ws_grens.gpkg", crs = 28992, quiet = TRUE) |>
  sf::st_transform(crs = 4326)

usethis::use_data(ws_grens_rd, ws_grens_wgs, overwrite = TRUE)

# hhskgroen <- "#8dc63f"

# hhskblauw <- "#0079c2"

logo <- png::readPNG("data-raw/logo_kleur.png") |> as.raster()

schonevoeten <- png::readPNG("data-raw/schonevoeten.png") |> as.raster()

usethis::use_data(logo, schonevoeten, overwrite = TRUE)