context("pre-process methods methods")
library(simpute)
library(testthat)

test_that("remove_high_missing_col with prop = 1 returns the same thing", {
  test_data  = dplyr::tibble(num = c(1,1,2,3,5),
                              char = c('a', 'a', NA, 'b', NA),
                              fac = as.factor(c('b', 'b', NA, 'a', NA)),
                              logical = c(TRUE, TRUE, FALSE, NA, NA))
  
  out = remove_high_missing_col(test_data, prop = 1)
  expect_equal(out, test_data)
})

test_that("remove_high_missing_col with prop = 0.1 works", {
  test_data  = dplyr::tibble(num = c(1,1,2,3,5),
                             char = c('a', 'a', NA, 'b', NA),
                             fac = as.factor(c('b', 'b', NA, 'a', NA)),
                             logical = c(TRUE, TRUE, FALSE, NA, NA))
  expected_output = dplyr::tibble(num = c(1,1,2,3,5))
  
  out = remove_high_missing_col(test_data, prop = 0.1)
  expect_equal(out,  expected_output)
})


test_that("remove_high_missing_row with prop = 1 works", {
  test_data  = dplyr::tibble(num = c(NA,1,2,3,5),
                             char = c(NA, 'a', 'b', 'b', 'c'),
                             fac = as.factor(c(NA, 'b', 'c', 'a', 'd')),
                             logical = c(NA, TRUE, FALSE, FALSE, TRUE))
  
  expected_output = test_data[-1, ]
  
  out = remove_high_missing_row(test_data, prop = 1)
  expect_equal(out,  expected_output)
})

test_that("remove_high_missing_row with prop = 0.6 works", {
  test_data  = dplyr::tibble(num = c(NA,NA,NA,3,5),
                             char = c(NA, NA, NA, 'b', 'c'),
                             fac = as.factor(c(NA, NA, 'c', 'a', 'd')),
                             logical = c(NA, TRUE, FALSE, FALSE, TRUE))
  
  expected_output = test_data[-c(1,2), ]
  
  out = remove_high_missing_row(test_data, prop = 0.6)
  expect_equal(out,  expected_output)
})

