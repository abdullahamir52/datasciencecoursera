# Looping on the Command Line
# -----------------------------------

# Writing for, while loops is useful when programming but not particularly 
# easy when working interactively on the command line. There are some 
# functions which implement looping to make life easier.

# 1. lapply: Loop over a list of objects and evaluate a function on each element
# 2. sapply: Same as lapply but try to simplify the result
# 3. apply: Apply a function over the margins of an array (matrix)
# 4. tapply: Apply a function over subsets of a vector (sort of table apply)
# 5. mapply: Multivariate version of lapply

# An auxiliary function split is also useful, particularly in conjunction 
# with lapply.


# 1 Loop Functions - lapply
# ------------------------------

# lapply takes three arguments: 
# 1. a list X; 
# 2. a function (or the name of a function) FUN; 
# 3. other arguments via its ... argument. 
# If X is not a list, it will be coerced to a list using as.list.

lapply
# function (X, FUN, ...) 
# {
#   FUN <- match.fun(FUN)
#   if (!is.vector(X) || is.object(X)) 
#     X <- as.list(X)
#   .Internal(lapply(X, FUN))
# }
# <bytecode: 0x000002000d197da8>
#   <environment: namespace:base>


# lapply always returns a list, regardless of the class of the input.
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)  # applies the function 'mean' over both elements of the list
# Output (output of lapply will always be a list)
# $a
# [1] 3
# $b
# [1] 0.3474802


# Another Example
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
# Output
# $a
# [1] 2.5
# $b
# [1] -0.1198232
# $c
# [1] 0.782726
# $d
# [1] 4.964196


# 'runif' generates a uniform random variable
# ---------------------------------------------
x <- 1:4
lapply(x, runif) 
# Output
# [[1]]
# [1] 0.7603133
# 
# [[2]]
# [1] 0.1554012 0.8494571
# 
# [[3]]
# [1] 0.9468178 0.5884192 0.5022508
# 
# [[4]]
# [1] 0.189779918 0.001836858 0.877578062 0.134111338



# Now suppose I want to call the runif function on each one of these elements
# of X but I didn't wanna generate a uniform between zero and one which is 
# default. Suppose I want to generate a uniform between zero and ten, so now
# I want put values into the arguments that are not default values. Particularly,
# I want to change the max value. 
# --------------------------------
x <- 1:4
lapply(x, runif, min = 0, max = 10)
# Output
# [[1]]
# [1] 0.2274122
# 
# [[2]]
# [1] 9.391367 2.929487
# 
# [[3]]
# [1] 1.643266 3.991026 4.595754
# 
# [[4]]
# [1] 4.3403085 5.1700983 8.4624575 0.5516429

# So, now the list I get out of this has random uniform that are in (0-10)



# lapply and friends make heavy use of anonymous functions (fn w/o names)
# Suppose I create two matrices within a list (x). Now I want to extract the
# first column of both matrices. 
# ------------------------------
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
# Output
# $a
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# 
# $b
# [,1] [,2]
# [1,]    1    4
# [2,]    2    5
# [3,]    3    6



# An anonymous function for extracting the first column of each matrix.
lapply(x, function(elt) elt[,1]) # write a function on-the-go
# Output
# $a
# [1] 1 2
# 
# $b
# [1] 1 2 3

# this function(elt) does not exist, except within the confines of lapply



# sapply
#-----------------------
# sapply will try to simplify the result of lapply if possible.
# If the result is a list where every element is length 1, 
# then a vector is returned.
# If the result is a list where every element is a vector of the same 
# length (> 1), a matrix is returned.
# If it can’t figure things out, a list is returned

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
# $a
# [1] 2.5
# 
# $b
# [1] 0.01869495
# 
# $c
# [1] 1.075839
# 
# $d
# [1] 5.061851


sapply(x, mean)
#       a          b          c          d 
# 2.50000000 0.01869495 1.07583942 5.06185108 

mean(x)
# [1] NA
# Warning message:
# In mean.default(x) : argument is not numeric or logical: returning NA