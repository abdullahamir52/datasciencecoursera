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

