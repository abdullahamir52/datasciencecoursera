# To update packages
old.packages()
update.packages()

# R packages
install.packages("devtools")
install.packages("ggvis")
install.packages("ggplot2")
install.packages("lme4")
version
sessioninfo
browseVignettes()
install.packages("learnr")
install.packages("rmarkdown")
install.packages("dplyr")
install.packages("data.table")
install.packages("ContourFunctions")


# Updating R/RStudio/Tidyverse
# Only on Windows
install.packages("installr")
library(installr)
updateR()
# From within RStudio, go to Help > Check for Updates
# to install newer version of RStudio (if available, optional).


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

# installing swirl() courses
install_course("R Programming")
install_course("R Programming E")
install_course("The R Programming Environment")
install_course("Regression Models")
install_course("Getting and Cleaning Data")
install_course("Statistical Inference")
install_course("Advanced R Programming")
# Creating a path for Rtools
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
# then restart R (Ctrl + shift + F10)
Sys.which("make")
#                                         make
# "C:\\PROGRA~1\\rtools40\\usr\\bin\\make.exe"
install.packages("jsonlite", type = "source")


# to use rmarkdown to make pdf, you need to install latex package: tinytex
install.packages('tinytex')
tinytex::install_tinytex()
# to uninstall TinyTeX, run tinytex::uninstall_tinytex()
tinytex:::is_tinytex()
# install at the very last. takes too long to install
