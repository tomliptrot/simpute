context("impute s3 methods")
library(simpute)
library(testthat)

x = c(1,NA,2,3,NA)

test_that("numeric median imputation works", {
  expect_equal(impute.numeric(x), c(1,2,2,3,2))
})
