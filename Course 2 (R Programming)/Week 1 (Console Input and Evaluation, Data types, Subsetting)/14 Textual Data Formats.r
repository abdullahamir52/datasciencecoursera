# Textual data formats
# dput and dget
# it basically writes the r code for the data
# works for a single object
y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "y.R")   # Creates a file in the working directory 'y.r'
new.y <- dget("y.R")    # Loads the file and creates a new df named 'new.y'
new.y
#   a b
# 1 1 a

# Dumping and sourcing
# works for multiple objects
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R") # Creates a file 
rm(x, y)                           # removes the x, y
source("data.R")                   # loads the 'data.r' in rstudio
y
#   a b
# 1 1 a
x
# [1] "foo"