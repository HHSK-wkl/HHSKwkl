# params


## ---- libs-funs ----

# Libraries
library(tidyverse)
library(knitr)
library(DT)
library(leaflet)
library(HHSKwkl)
library(readxl)
library(lubridate)

# Other options
dt_labels_nederlands()

options(OutDec = ",")

# my_datatable <- function(df, ...) {
#   DT::datatable(data = df, extensions = 'Buttons', 
#             options = list(dom = 'lfirtpB', buttons = c('csv', 'excel', 'pdf')), ...)
# }


## ---- load-data ----

copy_data("fys_chem.csv", "meetpunten.csv", "parameters.csv", "normen.txt")
fys_chem <- import_fys_chem()
meetpunten <- import_meetpunten()
parameters <- import_parameters()
normen <- import_normen_rivm(normen, parameters)