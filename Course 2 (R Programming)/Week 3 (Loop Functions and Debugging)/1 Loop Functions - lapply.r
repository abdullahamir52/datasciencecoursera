# 1 Loop Functions - lapply
# ------------------------------

# lapply takes three arguments: (1) a list X; (2) a function (or the name of a 
# function) FUN; (3) other arguments via its ... argument. If X is not a list, 
# it will be coerced to a list using as.list.

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
lapply(x, mean)
# Output
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



# lapply and friends make heavy use of anonymous functions
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
lapply(x, function(elt) elt[,1])
# Output
# $a
# [1] 1 2
# 
# $b
# [1] 1 2 3



# sapply
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