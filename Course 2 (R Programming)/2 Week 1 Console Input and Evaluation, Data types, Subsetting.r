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
y <- c(TRUE, 2)     #numeric
y <- c("a", TRUE)   #character
z <- c(1.7, "a")    #character

# Explicit coercion
x <- 0:6
class(x)
# "integer"

as.numeric(x)
as.logical(x)
as.character(x)

# List
x <- list(1, "a", TRUE, 1 + 4i)
# list can contain elements of different data types
x
# [[1]]
# [1] 1
# 
# [[2]]
# [1] "a"
# 
# [[3]]
# [1] TRUE
# 
# [[4]]
# [1] 1+4i


# Matrices
m <- matrix(nrow = 2, ncol = 3)
m

#       [,1] [,2] [,3]
# [1,]   NA   NA   NA
# [2,]   NA   NA   NA


dim(m) # To see the dimension of the matrices
# 2 3

attributes(m) # to see the attributes
# $dim
# [1] 2 3

# Matrices are organized column wise
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

# Matrices can also be created from vectors by adding a dimension attribute.
m <- 1:10
m                   # creats a variable with ten values in it
dim(m) <- c(2, 5)   # Creats a matrix from variable 'm'
m
#       [,1]  [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

# cbind-ing an rbind-ing
x <- 1:3
y <- 10:12
a1 <- cbind(x, y)
a1
#      x  y
# [1,] 1 10
# [2,] 2 11
# [3,] 3 12

a2 <- rbind(x, y)
a2
#     [,1] [,2] [,3]
# x    1    2    3
# y   10   11   12



# R Data types: Factors
# Factors can be ordered(lecturer, professor) or un-ordered(Male,female)
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
# [1] yes yes no  yes no 
# Levels: no yes

table(x)
# x
#   no yes 
#   2   3 

unclass(x)
# [1] 2 2 1 2 1
# attr(,"levels")
# [1] "no"  "yes"

# To change the order of the levels
# Since no comes before yes, alphabetically, the primary level is no. 
# you can change it using the level function 
x <- factor(c("yes", "yes", "no", "yes", "no"),
              levels = c("yes", "no"))
x
# [1] yes yes no  yes no 
# Levels: yes no


# Missing values
x <- c(1, 2, NA, 10, 3)
is.na(x)
# [1] FALSE FALSE  TRUE FALSE FALSE

is.nan(x)
# FALSE FALSE FALSE FALSE FALSE

x <- c(1, 2, NaN, NA, 4)
is.na(x)
# [1] FALSE FALSE  TRUE  TRUE FALSE

is.nan(x)
# [1] FALSE FALSE  TRUE FALSE FALSE

# A NaN value is also NA but the converse is not true



# R data types: Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
#   foo   bar
# 1   1  TRUE
# 2   2  TRUE
# 3   3 FALSE
# 4   4 FALSE

nrow(x)
# 4
ncol(x)
# 2



# Names

# Naming objects
x <- 1:3
x
# [1] 1 2 3

names(x)
# NULL

names(x) <- c("foo", "bar", "norf")
x
# foo  bar norf 
# 1    2    3 

names(x)
# [1] "foo"  "bar"  "norf"

# Naming lists
x <- list(a = 1, b = 2, c = 3)
x
# $a
# [1] 1
# 
# $b
# [1] 2
# 
# $c
# [1] 3


# Naming matrices
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
# c d
# a 1 3
# b 2 4


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



# Subsetting Basics

# Single bracket returns the same data type
# double bracket returns a list/data.frame
char_vector <- c("a", "b", "c", "c", "d", "a")
char_vector[1]
char_vector[2]
char_vector[1:4]
# [1] "a" "b" "c" "c"
# the example above used the numeric index

char_vector[char_vector > "a"]
# [1] "b" "c" "c" "d"

logical_vector <- char_vector > "a"
logical_vector
# FALSE  TRUE  TRUE  TRUE  TRUE FALSE

char_vector[logical_vector]
# "b" "c" "c" "d"
# the example above used the logical index



# Subsetting Lists
x <- list(foo = 1:4, bar = 0.6)
x[1]          # prints out the first element, foo
# $foo
# [1] 1 2 3 4


# If x is a list, x[1] is going to be a list too
x[[1]]        # prints out only the vector(foo), not the list
# [1] 1 2 3 4


x$bar         # Similar to the x[[1]], gives a vector
# [1] 0.6

x[["bar"]]    # Similar to the x[[1]], gives a vector
# [1] 0.6

x["bar"]      # Similar to the x[1], gives a list
# $bar
# [1] 0.6


# Extracting multiple elements from a list
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]
# $foo
# [1] 1 2 3 4
# 
# $baz
# [1] "hello"


# The [[ operator can be used with computed indices; 
# $ can only be used with literal names.
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]] ## computed index for ‘foo’
# [1] 1 2 3 4

x$name ## element ‘name’ doesn’t exist!
# NULL

x$foo
# [1] 1 2 3 4 

# The [[ can take an integer sequence.
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
# $a
# $a[[1]]
# [1] 10
# 
# $a[[2]]
# [1] 12
# 
# $a[[3]]
# [1] 14
# 
# 
# $b
# [1] 3.14 2.81

x[[c(1, 3)]]
# [1] 14

x[[1]][[3]]
# [1] 14

x[[c(2, 1)]]
# [1] 3.14



# Subsetting a Matrix
# Matrices can be subsetted in the usual way with (i,j) type indices.
x <- matrix(1:6, 2, 3)
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

x[1, 2]
# [1] 3

x[2, 1]
# [1] 2

# Indices can also be missing.
x[1, ]
# [1] 1 3 5

x[, 2]
# [1] 3 4

# By default, when a single element of a matrix is retrieved, 
# it is returned as a vector of length 1 rather
# than a 1 × 1 matrix. This behavior can be turned off by setting drop = FALSE.
x <- matrix(1:6, 2, 3)
x[1, 2]
# [1] 3

x[1, 2, drop = FALSE]
#       [,1]
# [1,]    3

# by default drop is true. it drops the dimension of the matrix
# and returns a single value. setting it false gives you a matrix

# Similarly, subsetting a single column or a single row will give you a vector, 
# not a matrix (by default).
x <- matrix(1:6, 2, 3)
x[1, ]
# [1] 1 3 5
x[1, , drop = FALSE]
#       [,1] [,2] [,3]
# [1,]    1    3    5


# Partial Matching
# Partial matching of names is allowed with [[ and $.
x <- list(aardvark = 1:5)
x
# $aardvark
# [1] 1 2 3 4 5

# x is a list contains an element named aardvark 
x$a
# [1] 1 2 3 4 5
# this command looks for an element that has 'a' in it > partial matching

x[["a"]]
# NULL
# this command looks for an element named 'a', exact matching

x[["a", exact = FALSE]]
# [1] 1 2 3 4 5
# double bracket command with exact matching set to false> partial matching




# Removing NA (missing) Values
x <- c(1, 2, NA, 4, NA, 5)
x
bad <- is.na(x)
# created a logical vector that tells me where the NA values are

bad
# [1] FALSE FALSE  TRUE FALSE  TRUE FALSE
# this gives us where the missing values are

x[!bad]
# [1] 1 2 4 5
# this gives us the values without the NA 

# What if there are multiple things and you want to take the subset 
# with no missing values?
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
# [1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE
x[good]
# [1] 1 2 4 5

y[good]
# [1] "a" "b" "d" "f"

# another example
airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]




# Vectorized Operations
# Many op. in R are vectorized > more efficient, concise, and easier to read.
x <- 1:4; y <- 6:9
x
# [1] 1 2 3 4
y
# [1] 6 7 8 9

x + y
# [1]  7  9 11 13
x > 2
# [1] FALSE FALSE  TRUE  TRUE
x >= 2
# [1] FALSE  TRUE  TRUE  TRUE
y == 8
# [1] FALSE FALSE  TRUE FALSE
x * y
# [1]  6 14 24 36
x / y
# [1] 0.1666667 0.2857143 0.3750000 0.4444444

# Vectorized Matrix Operations
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4
y
#       [,1] [,2]
# [1,]   10   10
# [2,]   10   10

x * y 
# element-wise multiplication
#       [,1] [,2]
# [1,]   10   30
# [2,]   20   40

x / y
# element-wise division
#       [,1] [,2]
# [1,]  0.1  0.3
# [2,]  0.2  0.4

x %*% y 
# true matrix multiplication
#       [,1] [,2]
# [1,]   40   40
# [2,]   60   60

x %/% y 
# true matrix division
#       [,1] [,2]
# [1,]    0    0
# [2,]    0    0