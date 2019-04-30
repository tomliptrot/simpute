
impute <- function (x, ...) {
  UseMethod("impute", x)
}


impute.numeric = function(x, .fun = median,...){
  x[is.na(x)] = .fun(x, na.rm = TRUE,...)
  x
}
impute.character = function(x){
  tt = table(x)
  mode = names(sort(x))[1]
  x[is.na(x)] = mode
  x
}
impute.factor = function(x){
  impute.character(x)
}
impute.logical = function(x){
  impute.character(x)
}

impute.data.frame = function(x, ...){
  map_df(x, impute, ...)
}
