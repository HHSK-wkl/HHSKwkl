context("test-01_import_data")

fys_chem <- import_fys_chem(fys_chem_csv = system.file("extdata", "test_fys_chem.csv", package = "HHSKwkl"))
meetpunten <- import_meetpunten(meetpunten_csv = system.file("extdata", "test_meetpunten.csv", package = "HHSKwkl"))

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

})

test_that("import_meetpunten works", {
  expect_is(meetpunten, "data.frame")
  expect_is(meetpunten$mp, "character")
  expect_is(meetpunten$x, "numeric")
  expect_is(meetpunten$y, "numeric")
})
