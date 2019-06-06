library(devtools)
setwd('~/simpute')
load_all()
install()

test()
document()

devtools::use_travis()
?remove_high_missing_row
devtools::check()
?importFrom()
