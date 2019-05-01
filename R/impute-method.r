
#' Simple Imputation
#'
#' Generic simple imputation method
#' @param x Numeric, Factor, Logical or Charater vector, or a Data Frame
#' @param ... arugments to be passed to othermethods
#'
#' @return
#' @export
#'
#' @examples
impute <- function (x, ...) {
  UseMethod("impute", x)
}

#' @describeIn impute Median Imputation for a numeric Vector
#' @param x
#' @param .fun a fuction (default median) to use for imputation
impute.numeric = function(x, .fun = median,...){
  x[is.na(x)] = .fun(x, na.rm = TRUE,...)
  x
}

#' @describeIn impute Mode Imputation for a character vector
impute.character = function(x){
  tt = table(x)
  mode = names(sort(tt, decreasing = TRUE))[1]
  x[is.na(x)] = mode
  x
}

#' @describeIn impute Mode Imputation for a factor vector
impute.factor = function(x){
  impute.character(x)
}

#' @describeIn impute Mode Imputation for a logical vector
impute.logical = function(x){
  as.logical(impute.character(x))
}

#' @describeIn impute data frame imputation
impute.data.frame = function(x, ...){
  purrr::map_df(x, impute, ...)
}
