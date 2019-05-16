context("test-30_grafieken")

test_that("hhsk_thema works", {
  expect_is(hhskthema(), "theme")
})

test_data <- import_fys_chem(fys_chem_csv = system.file("extdata", "test_fys_chem.csv", package = "HHSKwkl")) %>% 
  dplyr::filter(mp == "00007", parnr == 1)

test_data_imd <- import_fys_chem(fys_chem_csv = system.file("extdata", "test_fys_chem.csv", package = "HHSKwkl")) %>% 
  dplyr::filter(mp == "00633", parnr == 1198)

parameters <- import_parameters(parameter_csv = system.file("extdata", "test_parameters.csv", package = "HHSKwkl"))

normen <- import_normen_rivm(normen = system.file("extdata", "test_normen.txt", package = "HHSKwkl"), parameterdf = parameters)


test_that("grafiek_basis works", {
  
  expect_is(grafiek_basis(test_data), "ggplot")
  expect_is(grafiek_basis(test_data, mp = "00007", mpomsch = "omschrijving", parnaam = "chloride", eenheid = "mg/l"), "ggplot")
  })

test_that("boxplot_basis works", {
  
  expect_is(boxplot_basis(test_data), "ggplot")
  expect_is(boxplot_basis(test_data, mp = "00007", mpomsch = "omschrijving", parnaam = "chloride", eenheid = "mg/l"), "ggplot")
  })

test_that("titelpagina_internet works", {
  
  expect_is(titelpagina_internet(), "grob")
  })

test_that("normlijnen en add_normlijnen werkt", {
  grafiek <- grafiek_basis(test_data, plot_loess = FALSE) # onjuist parameter bij norm
  normen_object <- norm_lijnen(1198, normen)
  expect_is(normen_object, "Layer")
  expect_is(grafiek + normen_object, "ggplot")
  expect_is(grafiek %>% add_norm_lijnen(1198, normen), "ggplot")
})
