
library(tidyverse)
library(lubridate)
library(HHSKwkl)

copy_data("fys_chem.csv", "meetpunten.csv", "parameters.csv", "normen.txt")
fys_chem <- import_fys_chem()
meetpunten <- import_meetpunten()
parameters <- import_parameters()
normen <- import_normen_rivm(normen, parameters)