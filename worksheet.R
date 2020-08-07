
# core components:
# * R folder - 
#   - R scripts for functions, with roxygen documentation
#   - R script to document data - see https://github.com/tidyverse/ggplot2/blob/master/R/data.R
#
# * DESCRIPTION file
#  - version number, 
#  - date, 
#  - authors, 
#  - import (so dependencies can be installed when installing from CRAN)


# generate NAMESPACE and documentation
devtools::document()

# update readme
rmarkdown::render("README.Rmd")

# check package
devtools::check()


# -------


# to install from local copy
devtools::install()

# remotes::install_github("krlmlr/fledge")
fledge::update_news()


# check install from github

devtools::install_github("Faskally/rns") 
# equivalent to - devtools::install_github("Faskally/rns@master")
library(rns)
?Predict.matrix.rn.smooth


# check install from github development version (on different branch, e.g. develop)

devtools::install_github("Faskally/rns@develop")
library(rns)
?Predict.matrix.rn.smooth



# when developing
devtools::load_all()


# add data ---- 

usethis::use_data_raw()


