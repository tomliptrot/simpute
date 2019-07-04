library(devtools)
library(usethis)
setwd('~/simpute')

use_mit_license('Tom Liptrot')
load_all()
install()

test()
document()

devtools::use_travis()
?remove_high_missing_row
devtools::check()
?importFrom()
