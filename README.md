<!-- badges: start -->
  [![Travis build status](https://travis-ci.com/haoz515/HaoZheng.svg?branch=master)](https://travis-ci.com/haoz515/HaoZheng)
  [![Codecov test coverage](https://codecov.io/gh/haoz515/HaoZheng/branch/master/graph/badge.svg)](https://codecov.io/gh/haoz515/HaoZheng?branch=master)
  <!-- badges: end -->

## Use

The vignette demonstrates example usage of all main functions. Please [file an issue](https://github.com/haoz515/HaoZheng/issues) if you have a request for a tutorial that is not currently included. You can see the vignette by using the following code (note that this requires a TeX installation to view properly):


``` r
# install.packages("devtools")
devtools::install_github("haoz515/HaoZheng", build_vignette = TRUE, build_opts = c())
library(HaoZheng)
# Use this to view the vignette in the HaoZheng HTML help
help(package = "HaoZheng", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "HaoZheng")
```
