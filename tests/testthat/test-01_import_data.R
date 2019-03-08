context("test-01_import_data")

fys_chem <- import_fys_chem(fys_chem_csv = system.file("extdata", "test_fys_chem.csv", package = "HHSKwkl"))
meetpunten <- import_meetpunten(meetpunten_csv = system.file("extdata", "test_meetpunten.csv", package = "HHSKwkl"))
parameters <- import_parameters(parameter_csv = system.file("extdata", "test_parameters.csv", package = "HHSKwkl"))

test_that("import_fys_chem works",{
  
  
  expect_is(fys_chem, "data.frame")
  expect_is(fys_chem$mp, "character")
  expect_is(fys_chem$parnr, "numeric")
  expect_is(fys_chem$par, "character")
  expect_is(fys_chem$eenheid, "character")
  expect_is(fys_chem$datum, "Date")
  expect_is(fys_chem$waarde, "numeric")
  expect_is(fys_chem$detectiegrens, "character")
  
  
  expect_equal(fys_chem$mp[1], "00007")
  expect_equal(fys_chem$datum[1], as.Date("2010-01-19", format = "%Y-%m-%d"))
  
  alle_benodigde_fys_chem_kolommen <- all(c("mp", "parnr", "datum", "waarde", "detectiegrens") %in% names(fys_chem))
  expect_true(alle_benodigde_fys_chem_kolommen)

})

test_that("import_meetpunten works", {
  expect_is(meetpunten, "data.frame")
  expect_is(meetpunten$mp, "character")
  expect_is(meetpunten$x, "numeric")
  expect_is(meetpunten$y, "numeric")
  
  alle_benodigde_meetpuntkolommen <- all(c("mp", "mpomsch", "x", "y") %in% names(meetpunten))
  expect_true(alle_benodigde_meetpuntkolommen)
})

test_that("import_parameters works", {
  expect_is(parameters, "data.frame")
  expect_is(parameters$parnr, "numeric")
  expect_is(parameters$par, "character")
  expect_is(parameters$parnaamlang, "character")
  expect_is(parameters$eenheid, "character")
  
  alle_benodigde_parameterkolommen <- all(c("parnr", "par", "parnaamlang", "eenheid", "aquo_parcode", "aquo_eenheid", "aquo_hoedanigheid", "aquo_compartiment") %in% names(parameters))
  expect_true(alle_benodigde_parameterkolommen)
  
})
