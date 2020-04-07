test_fys_chem <- function(){import_fys_chem(system.file("extdata", "test_fys_chem.csv", package = "HHSKwkl"))}

test_parameters <- function(){import_parameters(system.file("extdata", "test_parameters.csv", package = "HHSKwkl"))}

test_meetpunten <- function(){ import_meetpunten(system.file("extdata", "test_meetpunten.csv", package = "HHSKwkl"))}

test_normen <- function(){
  import_normen_rivm(normen = system.file("extdata", "test_normen.txt", package = "HHSKwkl"), 
                     parameterdf = import_parameters(system.file("extdata", "test_parameters.csv", package = "HHSKwkl")))}