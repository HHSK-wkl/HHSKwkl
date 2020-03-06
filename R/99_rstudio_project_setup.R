rstudio_project_setup <- function(path, ...) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  
  dir.create(file.path(path, "R"))
  dir.create(file.path(path, "data"))
  dir.create(file.path(path, "images"))
  dir.create(file.path(path, "CSS"))
  
  # write to index file
  
  contents <- paste("library(tidyverse)",
                    "library(HHSKwkl)",
                    "library(lubridate)",
                    "",
                    'copy_data(c("fys_chem.csv", "parameters.csv", "meetpunten.csv"))',
                    "",
                    "fys_chem <- import_fys_chem()",
                    "parameters <- import_parameters()",
                    "meetpunten <- import_meetpunten()",
                    sep = "\n")
  

  writeLines(contents, con = file.path(path, "R/init.R"))
    
}

