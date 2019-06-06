#' Remove Columns with a High Proportion of Missing Values
#' 
#' Use \code{remove_high_missing_col} to remove columns from a dataframe that have an excessive proportion of missing values.
#' 
#' @param x a dataframe
#'
#' @param prop a number between 0 and 1, if a column has more than this proportion of missing values it is removed. (default = 1)
#' @param n the number of rows to use to sample from when calculating the proportion of missing vaalue. useful for large datasets. (default = 1000)
#' @return a \code{dataframe} with missing rows removed
#' @export
remove_high_missing_col = function (x, prop = 1, n = 1000) {
  if(nrow(x) > n){
    sample_rows = sample.int(nrow(x), size = n)
    
    prop_missing = x[sample_rows, ] %>%
      is.na() %>%
      apply(2, mean)
  }
  else {
    prop_missing = x %>%
      is.na() %>%
      apply(2, mean)
  }

  index = prop_missing < prop
  cat("Removing", sum(!index), "columns with", prop * 100, 
      "% or more missing data")
  out = x[, index]
  out
}

#' Remove Rows with a High Proportion of Missing Values
#' 
#' Use \code{remove_high_missing_row} to remove rows from a datarame that have an excessive proportion of missing values.
#' 
#' @param x a dataframe
#'
#' @param prop a number between 0 and 1. If a row has more or equal to this proportion of missing values it is removed. (default = 1)
#' @param n the number of columns to use to sample from when calculating the proportion of missing vaalue. useful for large datasets. (default = 1000)
#' @return a \code{dataframe} with missing rowss removed
#' @export
remove_high_missing_row = function (x, prop = 1, n = 1000) {
  
  if(ncol(x) > n){
    sample_cols = sample.int(ncol(x), size = n)
    prop_missing = x[, sample_cols] %>%
      is.na() %>%
      apply(1, mean)
  }
  else {
    prop_missing = x %>%
      is.na() %>%
      apply(1, mean)
  }

  index = prop_missing < prop
  cat("Removing", sum(!index), "rows with", prop * 100, 
      "% or more missing data")
  out = x[index, ]
  out
}
