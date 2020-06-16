
library(tidyverse)
library(lubridate)
library(HHSKwkl)

theme_set(hhskthema())

copy_data(c("fys_chem.csv", "meetpunten.csv", "parameters.csv", "normen.txt"))
fys_chem <- import_fys_chem()
meetpunten <- import_meetpunten()
parameters <- import_parameters()
normen <- import_normen_rivm(parameterdf = parameters)
ws_grens <- sf::st_read("data/ws_grens.gpkg", crs = 28992)