# R packages
install.packages("devtools")
install.packages("ggvis")
install.packages("ggplot2")
install.packages("lme4")
old.packages()
version
sessioninfo
browseVignettes()
install.packages("learnr")
install.packages("rmarkdown")
install.packages("dplyr")


# Updating R/RStudio/Tidyverse
# Only on Windows
install.packages("installr")
library(installr)
updateR()
# From within RStudio, go to Help > Check for Updates 
# to install newer version of RStudio (if available, optional).


# to use rmarkdown to make pdf, you need to install latex package: tinytex
install.packages('tinytex')
tinytex::install_tinytex()
# to uninstall TinyTeX, run tinytex::uninstall_tinytex() 
tinytex:::is_tinytex() 



# Learn R using SWIRL
install.packages("swirl")
# If you've installed swirl in the past make sure having version 2.2.21 or later.
# You can check this with: 
packageVersion("swirl")
# Every time you want to use swirl, you need to first load the package.
library("swirl")
# swirl offers a variety of interactive courses, 
# install_course("Course Name Here")
# but for our purposes, you want the one called R Programming. 
# Type the following from the R prompt to install this course: 
install_from_swirl("R Programming")
# go to https://github.com/swirldev/swirl_courses#swirl-courses
# Start swirl and complete the lessons
swirl()

