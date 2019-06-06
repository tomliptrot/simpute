
#' Simple Imputation
#'
#' Generic simple imputation method
#' @param x Numeric, Factor, Logical or Charater vector, or a Data Frame
#' @param ... arugments to be passed to othermethods
#'
#' @return an imputed dataset of the  same class as x
#' @export
#'
#' @examples
impute <- function (x, ...) {
  UseMethod("impute", x)
}

#' @describeIn impute Median Imputation for a numeric Vector
#'
#' Median Imputation for a numeric Vector
#' @param x
#' @param .fun a fuction (default median) to use for imputation
#' @export
impute.numeric = function(x, .fun = median,...){
  na_mask = is.na(x)
  if(all(na_mask)) {
    warning('All data missing, returning original')
    return(x)
  }
  x[na_mask] = .fun(x, na.rm = TRUE,...)
  x
}

#' @describeIn impute Mode Imputation for a character vector
#' @export
impute.character = function(x){
  na_mask = is.na(x)
  if(all(na_mask)) {
    warning('All data missing, returning original')
    return(x)
  }
  tt = table(x)
  mode = names(sort(tt, decreasing = TRUE))[1]
  x[na_mask] = mode
  x
}

#' @describeIn impute Mode Imputation for a factor vector
#' @export
impute.factor = function(x){
  na_mask = is.na(x)
  if(all(na_mask)) {
    warning('All data missing, returning original')
    return(x)
  }
  impute.character(x)
}

#' @describeIn impute Mode Imputation for a logical vector
#' @export
impute.logical = function(x){
  na_mask = is.na(x)
  if(all(na_mask)) {
    warning('All data missing, returning original')
    return(x)
  }
  as.logical(impute.character(x))
}

#' @describeIn impute data frame imputation
#' @export
impute.data.frame = function(x, ...){
  purrr::map_df(x, impute, ...)
}

#' @describeIn impute data frame imputation
#' @export
impute.tbl_df = function(x, ...){
  purrr::map_df(x, impute, ...)
}
