library(readr)
library(dplyr)
library(stringr)
library(png)


hhskgroen <- "#8dc63f"

hhskblauw <- "#0079c2"

logo <- readPNG("data-raw/logo website.png") %>% as.raster()

schonevoeten <- readPNG("data-raw/schonevoeten.png") %>% as.raster()

my_CRS <- "+init=EPSG:28992"



{maand_namen <- factor(x = c(1:12), labels = c('januari', 'februari', 'maart', 'april', 'mei', 'juni', 'juli', 'augustus', 'september', 'oktober', 'november', 'december'), ordered = TRUE)
Maand_namen <- factor(x = c(1:12), labels = c("Januari", "Februari", "Maart", "April", "Mei", "Juni", "Juli", "Augustus", "September", "Oktober", "November", "December"), ordered = TRUE)
maand_namen <- dplyr::tibble(maand = c(1:12), maand_namen, Maand_namen)}



devtools::use_data(my_CRS, hhskgroen, hhskblauw, logo, schonevoeten)
devtools::use_data(maand_namen)
