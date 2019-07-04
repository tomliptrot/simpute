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

summary(airquality)

     Ozone           Solar.R           Wind             Temp           Month            Day      
 Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00   Min.   :5.000   Min.   : 1.0  
 1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00   1st Qu.:6.000   1st Qu.: 8.0  
 Median : 31.50   Median :205.0   Median : 9.700   Median :79.00   Median :7.000   Median :16.0  
 Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88   Mean   :6.993   Mean   :15.8  
 3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00   3rd Qu.:8.000   3rd Qu.:23.0  
 Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00   Max.   :9.000   Max.   :31.0  
 NA's   :37       NA's   :7                                                                      

airquality_complete = impute(airquality)
summary(airquality_complete)

     Ozone           Solar.R           Wind             Temp           Month            Day      
 Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00   Min.   :5.000   Min.   : 1.0  
 1st Qu.: 21.00   1st Qu.:120.0   1st Qu.: 7.400   1st Qu.:72.00   1st Qu.:6.000   1st Qu.: 8.0  
 Median : 31.50   Median :205.0   Median : 9.700   Median :79.00   Median :7.000   Median :16.0  
 Mean   : 39.56   Mean   :186.8   Mean   : 9.958   Mean   :77.88   Mean   :6.993   Mean   :15.8  
 3rd Qu.: 46.00   3rd Qu.:256.0   3rd Qu.:11.500   3rd Qu.:85.00   3rd Qu.:8.000   3rd Qu.:23.0  
 Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00   Max.   :9.000   Max.   :31.0  
```

## Example 2: removing excess missing rows and columns
In some cases there is too much missing data and it might be a beter idea to completly remove either a row or column. In these cases we can use the functions `remove_high_missing_row` or `remove_high_missing_col`. The argument `prop` determines what proportion of data must be missing for the row/column to be removed.


``` r
library(simpute)

remove_missing_col(airquality,  prop = 0.1)

remove_missing_row(airquality,  prop = 0.1)

```
