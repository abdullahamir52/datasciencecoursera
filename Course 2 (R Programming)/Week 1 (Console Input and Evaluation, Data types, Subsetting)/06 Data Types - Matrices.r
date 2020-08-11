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
