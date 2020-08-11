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