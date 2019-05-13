context("test-51_twn_info")


# parent ------------------------------------------------------------------

test_that("fun_twn_parent works", {
  expect_is(fun_twn_parent(), "function")
  
  expect_equal(fun_twn_parent()(c("Bufo calamita", "Bufo bufo", "Bufo")), c(NA, "Bufo", "Bufonidae"))
  expect_true(is.na(fun_twn_parent()(NA)))
  
  expect_true(length(fun_twn_parent()(NA)) == 1)
  expect_true(length(fun_twn_parent()(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
  
})

test_that("get_twn_parent works", {
  expect_equal(get_twn_parent(c("Bufo calamita", "Bufo bufo", "Bufo")), c(NA, "Bufo", "Bufonidae"))
  expect_true(is.na(get_twn_parent(NA)))
  
  expect_true(length(get_twn_parent(NA)) == 1)
  expect_true(length(get_twn_parent(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
})


# voorkeur ----------------------------------------------------------------


test_that("fun_twn_voorkeur works", {
  expect_is(fun_twn_voorkeur(), "function")
  
  expect_equal(fun_twn_voorkeur()(c("Bufo calamita", "Bufo bufo", "Bufo")), c("Epidalea calamita", "Bufo bufo", "Bufo"))
  expect_true(is.na(fun_twn_voorkeur()(NA)))
  
  expect_true(length(fun_twn_voorkeur()(NA)) == 1)
  expect_true(length(fun_twn_voorkeur()(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
  
})

test_that("get_twn_voorkeur works", {
  expect_equal(get_twn_voorkeur(c("Bufo calamita", "Bufo bufo", "Bufo")), c("Epidalea calamita", "Bufo bufo", "Bufo"))
  expect_true(is.na(get_twn_voorkeur(NA)))
  
  expect_true(length(get_twn_voorkeur(NA)) == 1)
  expect_true(length(get_twn_voorkeur(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
})


# status ------------------------------------------------------------------

test_that("fun_twn_status works", {
  expect_is(fun_twn_status(), "function")
  
  expect_equal(fun_twn_status()(c("Bufo calamita", "Bufo bufo", "Bufo")), c("20", "10", "10"))
  expect_true(is.na(fun_twn_status()(NA)))
  
  expect_true(length(fun_twn_status()(NA)) == 1)
  expect_true(length(fun_twn_status()(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
  
})

test_that("get_twn_status works", {
  expect_equal(get_twn_status(c("Bufo calamita", "Bufo bufo", "Bufo")), c("20", "10", "10"))
  expect_true(is.na(get_twn_status(NA)))
  
  expect_true(length(get_twn_status(NA)) == 1)
  expect_true(length(get_twn_status(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
})


# localname ---------------------------------------------------------------

test_that("fun_twn_localname works", {
  expect_is(fun_twn_localname(), "function")
  
  expect_equal(fun_twn_localname()(c("Bufo calamita", "Bufo bufo", "Bufo")), c("Rugstreeppad", "Gewone pad", NA))
  expect_true(is.na(fun_twn_localname()(NA)))
  
  expect_true(length(fun_twn_localname()(NA)) == 1)
  expect_true(length(fun_twn_localname()(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
  
})

test_that("get_twn_localname works", {
  expect_equal(get_twn_localname(c("Bufo calamita", "Bufo bufo", "Bufo")), c("Rugstreeppad", "Gewone pad", NA))
  expect_true(is.na(get_twn_localname(NA)))
  
  expect_true(length(get_twn_localname(NA)) == 1)
  expect_true(length(get_twn_localname(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
})


# taxonlevel --------------------------------------------------------------

test_that("fun_twn_taxonlevel works", {
  expect_is(fun_twn_taxonlevel(), "function")
  
  expect_equal(as.character(fun_twn_taxonlevel()(c("Bufo calamita", "Bufo bufo", "Bufo"))), c("Species", "Species", "Genus"))
  expect_true(is.na(fun_twn_taxonlevel()(NA)))
  
  expect_true(length(fun_twn_taxonlevel()(NA)) == 1)
  expect_true(length(fun_twn_taxonlevel()(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
  
})

test_that("get_twn_taxonlevel works", {
  expect_equal(as.character(get_twn_taxonlevel(c("Bufo calamita", "Bufo bufo", "Bufo"))), c("Species", "Species", "Genus"))
  expect_true(is.na(get_twn_taxonlevel(NA)))
  
  expect_true(length(get_twn_taxonlevel(NA)) == 1)
  expect_true(length(get_twn_taxonlevel(c("Bufo calamita", "Bufo bufo", "Bufo"))) == 3)
})
