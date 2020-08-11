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