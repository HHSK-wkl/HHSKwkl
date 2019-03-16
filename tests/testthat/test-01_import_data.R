context("test-01_import_data")


test_that("import_fys_chem werkt",{
  fys_chem <- import_fys_chem(fys_chem_csv = system.file("extdata", "test_fys_chem.csv", package = "HHSKwkl"))  
  
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

test_that("import_meetpunten werkt", {
  meetpunten <- import_meetpunten(meetpunten_csv = system.file("extdata", "test_meetpunten.csv", package = "HHSKwkl"))
  
  expect_is(meetpunten, "data.frame")
  expect_is(meetpunten$mp, "character")
  expect_is(meetpunten$x, "numeric")
  expect_is(meetpunten$y, "numeric")
  
  alle_benodigde_meetpuntkolommen <- all(c("mp", "mpomsch", "x", "y") %in% names(meetpunten))
  expect_true(alle_benodigde_meetpuntkolommen)
})

test_that("import_parameters werkt", {
  parameters <- import_parameters(parameter_csv = system.file("extdata", "test_parameters.csv", package = "HHSKwkl"))
  
  expect_is(parameters, "data.frame")
  expect_is(parameters$parnr, "numeric")
  expect_is(parameters$par, "character")
  expect_is(parameters$parnaamlang, "character")
  expect_is(parameters$eenheid, "character")
  
  alle_benodigde_parameterkolommen <- all(c("parnr", "par", "parnaamlang", "eenheid", "aquo_parcode", "aquo_eenheid", "aquo_hoedanigheid", "aquo_compartiment") %in% names(parameters))
  expect_true(alle_benodigde_parameterkolommen)
  
})

test_that("import_biologie werkt", {
  biologie <- import_biologie(biologie_csv = system.file("extdata", "test_biologie.csv", package = "HHSKwkl"))
  
  expect_is(biologie, "data.frame")
  expect_is(biologie$mp, "character")
  expect_is(biologie$datum, "Date")
  expect_is(biologie$taxatype, "character")
  expect_is(biologie$methode, "character")
  expect_is(biologie$naam, "character")
  expect_is(biologie$waarde, "numeric")
  expect_is(biologie$monster_id, "integer")
  
  alle_benodigde_parameterkolommen <- all(c("mp", "datum", "methode", "naam", "waarde") %in% names(biologie))
  expect_true(alle_benodigde_parameterkolommen)
  
})

test_that("import_biologie_stadia werkt", {
  biologie_stadia <- import_biologie_stadia(biologie_csv = system.file("extdata", "test_biologie.csv", package = "HHSKwkl"))
  
  expect_is(biologie_stadia, "data.frame")
  expect_is(biologie_stadia$mp, "character")
  expect_is(biologie_stadia$datum, "Date")
  expect_is(biologie_stadia$taxatype, "character")
  expect_is(biologie_stadia$methode, "character")
  expect_is(biologie_stadia$naam, "character")
  expect_is(biologie_stadia$waarde, "numeric")
  expect_is(biologie_stadia$monster_id, "integer")
  
  alle_benodigde_parameterkolommen <- all(c("mp", "datum", "methode", "naam", "waarde") %in% names(biologie_stadia))
  expect_true(alle_benodigde_parameterkolommen)
  
})

test_that("import_biologie_kenmerken werkt", {
  biologie_kenmerken <- import_biologie_kenmerken(kenmerken_csv = system.file("extdata", "test_biologie_kenmerken.csv", package = "HHSKwkl"))
  
  expect_is(biologie_kenmerken, "data.frame")
  expect_is(biologie_kenmerken$mp, "character")
  expect_is(biologie_kenmerken$datum, "Date")
  expect_is(biologie_kenmerken$taxatype, "character")
  expect_is(biologie_kenmerken$methode, "character")
  expect_is(biologie_kenmerken$kenmerkcode, "character")
  expect_is(biologie_kenmerken$kenmerknaam, "character")
  expect_is(biologie_kenmerken$waarde, "numeric")
  expect_is(biologie_kenmerken$waarde_tekst, "character")
  expect_is(biologie_kenmerken$waarde_klasse, "numeric")
  
  alle_benodigde_parameterkolommen <- all(c("mp", "datum", "methode", "kenmerkcode","kenmerknaam", "waarde", "waarde_tekst", "waarde_klasse") %in% names(biologie_kenmerken))
  expect_true(alle_benodigde_parameterkolommen)
  
})

test_that("import_normen_rivm werkt",{
  parameters <- import_parameters(parameter_csv = system.file("extdata", "test_parameters.csv", package = "HHSKwkl"))
  normen <- import_normen_rivm(normen = system.file("extdata", "test_normen.txt", package = "HHSKwkl"), parameterdf = parameters)

  expect_is(normen, "data.frame")
  expect_is(normen$parnr, "numeric")
  expect_is(normen$norm_JGM, "numeric")
  expect_is(normen$norm_MAX, "numeric")
  expect_is(normen$norm_P90, "numeric")

})
