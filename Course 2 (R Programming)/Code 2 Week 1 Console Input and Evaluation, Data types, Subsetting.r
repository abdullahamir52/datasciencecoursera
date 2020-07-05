# ENTERING INPUT

msg <- "hello"

x <- ## Incomplete expression
'hello me'

rm(x)
# rm() removes the object



# PRINTING

x <- 1:20 
x



# R DATA TYPES 

# To write an integer, use L suffix
# Inf means infinity
# NaN means not a number or a missing values 




# CREATING VECTORS

# use the c() functions> concatenates things
x <- vector("numeric", 10)

# Mixing objects (Coercion error)
y <- c(TRUE, 2) #numeric
y <- c("a", TRUE) #character
y <- c(1.7, "a") #character

# Explicit coercion
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

# List
x <- list(1, "a", TRUE, 1 + 4i)
# list can contain elements of different data types
x

# Matrices
m <- matrix(nrow = 2, ncol = 3)
m
dim(m) # To see the dimension of the matrices
attributes(m) # to see the attributes

# Matrices are organized column wise
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# Matrices can also be created from vectors by adding a dimension attribute.
m <- 1:10
m
dim(m) <- c(2, 5)
m

# cbind-ing an rbind-ing
x <- 1:3
y <- 10:12
a1 <- cbind(x, y)
a1
a2 <- rbind(x, y)
a2




# R Data types: Factors
# Factors can be ordered(lecturer, professor) or un-ordered(Male,female)
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)

# To change the order of the levels
# Since no comes before yes, alphabetically, the primary level is no. 
# you can change it using the level function 
x <- factor(c("yes", "yes", "no", "yes", "no"),
              levels = c("yes", "no"))
x



# Missing values
x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)
# A NaN value is also NA but the converse is not true



# Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)




# Names

# Naming objects
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)

# Naming lists
x <- list(a = 1, b = 2, c = 3)
x

# Naming matrices
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m



# Textual data formats
# dput and dget
# it basically writes the r code for the data
# works for a single object
y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y

# Dumping and sourcing
# works for multiple objects
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x, y)
source("data.R")
y
x




# Subsetting Basics

# Single bracket returns the same data type
# double bracket returns a list/data.frame
char_vector <- c("a", "b", "c", "c", "d", "a")
char_vector[1]
char_vector[2]
char_vector[1:4]
# the example above used the numeric index
char_vector[char_vector > "a"]
logical_vector <- char_vector > "a"
logical_vector
char_vector[logical_vector]
# the example above used the logical index



# Subsetting Lists
x <- list(foo = 1:4, bar = 0.6)
x[1] 
# prints out the first element, foo
# If x is a list, x[1] is going to be a list too
x[[1]] 
# prints out only the vector(foo), not the list
x$bar 
# Similar to the x[[1]], gives a vector
x[["bar"]]
# Similar to the x[[1]], gives a vector
x["bar"]
# Similar to the x[1], gives a list



# Extracting multiple elements from a list
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]



# The [[ operator can be used with computed indices; 
# $ can only be used with literal names.
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]] ## computed index for ‘foo’
x$name ## element ‘name’ doesn’t exist!
x$foo


# The [[ can take an integer sequence.
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]
x[[1]][[3]]
x[[c(2, 1)]]




# Subsetting a Matrix
# Matrices can be subsetted in the usual way with (i,j) type indices.
x <- matrix(1:6, 2, 3)
x[1, 2]
x[2, 1]
# Indices can also be missing.
x[1, ]
x[, 2]

# By default, when a single element of a matrix is retrieved, 
# it is returned as a vector of length 1 rather
# than a 1 × 1 matrix. This behavior can be turned off by setting drop = FALSE.
x <- matrix(1:6, 2, 3)
x[1, 2]
x[1, 2, drop = FALSE]
# by default drop is true. it drops the dimension of the matrix
# and returns a single value. setting it false gives you a matrix

# Similarly, subsetting a single column or a single row will give you a vector, 
# not a matrix (by default).
x <- matrix(1:6, 2, 3)
x[1, ]
x[1, , drop = FALSE]


# Partial Matching
# Partial matching of names is allowed with [[ and $.
x <- list(aardvark = 1:5)
x
# x is a list contains an element named aardvark 
x$a
# this command looks for an element that has 'a' in it > partial matching
x[["a"]]
# this command looks for an element named 'a', exact matching
x[["a", exact = FALSE]]
# double bracket command with exact matching set to false> partial matching




# Removing NA (missing) Values
x <- c(1, 2, NA, 4, NA, 5)
x
bad <- is.na(x)
# created a logical vector that tells me where the NA values are
bad
# this gives us where the missing values are
x[!bad]
# this gives us the values without the NA 

# What if there are multiple things and you want to take the subset 
# with no missing values?
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]

# another example
airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]




# Vectorized Operations
# Many op. in R are vectorized > more efficient, concise, and easier to read.
x <- 1:4; y <- 6:9
x + y
x > 2
x >= 2
y == 8
x * y
x / y


# Vectorized Matrix Operations
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x
y

x * y 
# element-wise multiplication
x / y
# element-wise division

x %*% y 
# true matrix multiplication
x %/% y 
# true matrix division