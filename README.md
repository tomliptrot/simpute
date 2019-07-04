# simpute

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/tomliptrot/simpute.svg?branch=master)](https://travis-ci.org/tomliptrot/simpute)
<!-- badges: end -->

The goal of simpute  to do Simple Imputation that works for all data types and provides a quick starting point for modelling tasks. Many other packages do more complex forms of imputation (MICE, Amelia, missForest, Hmisc, mi). Simpute is quick, simple and robust.

## Installation

You can install the development version of simpute from github:

``` r
devtools::install_github("tomliptrot/simpute")
```

## Example 1: imputation

The most basic use case is to impute all missing values in a dataframe using the `impute` function. This is done using the median for continous data and the mode for categorical data.

``` r
library(simpute)
colSums(is.na(airquality))

Ozone Solar.R    Wind    Temp   Month     Day 
37       7       0       0       0       0 

airquality_complete = impute(airquality)
colSums(is.na(airquality_complete))

Ozone Solar.R    Wind    Temp   Month     Day 
0       0       0       0       0       0 
```

## Example 2: removing excess missing rows and columns
In some cases there is too much missing data and it might be a beter idea to completly remove either a row or column. In these cases we can use the functions `remove_high_missing_row` or `remove_high_missing_col`. The argument `prop` determines what proportion of data must be missing for the row/column to be removed.


``` r
library(simpute)

remove_missing_col(airquality,  prop = 0.1)

remove_missing_row(airquality,  prop = 0.1)

```
