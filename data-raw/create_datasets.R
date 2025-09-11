# library(readr)
# library(dplyr)
# library(stringr)
# library(png)
# library(colorspace)

blauw_d <-  "#293173" # hsl(234, 47%,  31%)  Orig HHSK
blauw   <-  "#0067C6" # hsl(209, 100%, 39%)
blauw_m <-  "#339cff" # hsl(209, 100%, 60%)
blauw_l <-  "#99ceff" # hsl(209, 100%, 80%)
groen_d <-  "#015F03" # hsl(121, 98%,  19%)  Orig HHSK
groen   <-  "#76B900" # hsl(82,  100%, 36%)
groen_m <-  "#b4ff33" # hsl(82,  100%, 60%)
groen_l <-  "#daff99" # hsl(82,  100%, 80%)
oranje  <-  "#c24105" # hsl(19,  95%,  39%)
oranje_m <- "#fa7538" # hsl(19,  95%,  60%)
oranje_l <- "#fcba9c" # hsl(19,  94%,  80%)
grijs_d <-  "#4F4F4F" # hsl(0,   0%,   31%)
grijs   <-  "#636363" # hsl(0,   0%,   39%)
grijs_m <-  "#999999" # hsl(0,   0%,   60%)
grijs_l <-  "#cccccc" # hsl(0,   0%,   80%)
wit     <-  "#FFFFFF"
tekstgrijs <- "#222222" #hsl(0,  0%,   13%)

blauw_m_orig  <- "#8ED4DA" # Orig HHSK
blauw_l_orig  <- "#D2EBEE" # Orig HHSK
groen_m_orig  <- "#CBDF74" # Orig HHSK
groen_l_orig  <- "#E7F0C0" # Orig HHSK
oranje_orig   <- "#F9651F" # Orig HHSK hsl(19,  95%,  55%)
oranje_m_orig <- "#FFBC80" # orig HHSK

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
  oranje_l = oranje_l,
  grijs_d  = grijs_d ,
  grijs    = grijs   ,
  grijs_m  = grijs_m ,
  grijs_l  = grijs_l ,
  wit      = wit     ,
  tekstgrijs = tekstgrijs,
  blauw_m_orig = blauw_m_orig,
  blauw_l_orig = blauw_l_orig,
  groen_m_orig = groen_m_orig,
  groen_l_orig = groen_l_orig,
  oranje_orig  = oranje_orig ,
  oranje_m_orig = oranje_m_orig)

usethis::use_data(blauw, groen, oranje, grijs, wit, 
                  blauw_d, groen_d,           grijs_d, 
                  blauw_m, groen_m, oranje_m, grijs_m, 
                  blauw_l, groen_l, oranje_l, grijs_l, 
                  tekstgrijs,
                  blauw_m_orig, blauw_l_orig, groen_m_orig, groen_l_orig, oranje_orig, oranje_m_orig,
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

