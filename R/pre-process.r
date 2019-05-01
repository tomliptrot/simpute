#' @export
remove_high_missing_col = function(x, prop = 1){
  prop_missing = apply(is.na(x), 2, all)
  index = prop_missing < prop
  cat('Removing', sum(!index), 'columns with', prop *100, '% or more missing data')
  out = x[, index]
  out
}



