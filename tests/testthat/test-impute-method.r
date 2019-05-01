context("impute s3 methods")
library(simpute)
library(testthat)


impute(test_data)

test_that("numeric median imputation works", {
  expect_equal(impute(c(1,NA,2,3,NA)), c(1,2,2,3,2))
})

test_that("character mode imputation works", {
  expect_equal(impute(c('a', 'a', NA, 'b')), c('a', 'a', 'a', 'b'))
  #to do - how to deal with ties??
})

test_that("factor mode imputation works", {
  fac = as.factor(c('b', 'b', NA, 'a'))
  fac2 = as.factor(c('b', 'b', 'b', 'a'))
  expect_equal(impute.factor(fac), fac2 )
  expect_equal(impute.factor(factor(fac, ordered = TRUE)), factor(fac2, ordered = TRUE) )
})

test_that("logical mode imputation works", {
  expect_equal(impute(c(TRUE, TRUE, FALSE, NA, NA)), c(TRUE, TRUE, FALSE, TRUE, TRUE) )
})

test_that("data frame imputation works", {
  test_data = dplyr::data_frame(num = c(1,NA,2,3,NA),
                         char = c('a', 'a', NA, 'b', NA),
                         fac = as.factor(c('b', 'b', NA, 'a', NA)),
                         logical = c(TRUE, TRUE, FALSE, NA, NA))
  test_data_complete = dplyr::data_frame(num = c(1,2,2,3,2),
                         char = c('a', 'a', 'a', 'b', 'a'),
                         fac = as.factor(c('b', 'b', 'b', 'a', 'b')),
                         logical = c(TRUE, TRUE, FALSE, TRUE, TRUE))
  expect_equal(impute.data.frame(test_data), test_data_complete )
})

impute.data.frame(test_data)


