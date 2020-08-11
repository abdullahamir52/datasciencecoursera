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