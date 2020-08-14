# apply
# ----------------

# apply is used to a evaluate a function (often an anonymous one) over the 
# margins of an array. It is most often used to apply a function to the rows 
# or columns of a matrix. It can be used with general arrays, e.g. taking 
# the average of an array of matrices. It is not really faster than writing 
# a loop, but it works in one line!

str(apply)
# function (X, MARGIN, FUN, ...)  

# X is an array (matrices)
# MARGIN is an integer vector indicating which margins should be “retained”.
# FUN is a function to be applied
# ... is for other arguments to be passed to FUN


x <- matrix(rnorm(200), 20, 10) # creates a (20x10) matrix

# We want to calculate the mean of all the rows. Keep the column dimension 
# intact. So '2' in the argument keeps the column intact, and calculates 
# the mean of the rows and collapses the 20 rows
apply(x, 2, mean) 
# Output
# [1]  0.041597801 -0.007965326 -0.067736108 -0.442325546 -0.319348298
# [6] -0.160523432  0.054901735  0.037705261 -0.157675375  0.164261296

apply(x, 1, sum) # preserve the rows, collapse the columns
# Output
# [1]  -5.4715707  -0.2029979   5.6390271   2.9712664  -4.7227922
# [6]  -4.6296715  -3.4401373   0.7085447   7.1666165   3.7750684
# [11]  -2.2374511  -0.3080558  -2.0090229  -6.1822947  -0.9802599
# [16] -10.4664555  -0.1741214   1.2001970   1.2206894   1.0012615



# col/row sums and means
# --------------------------
# We use the previous functions so much in R, that we have separate functions
# that applies the 'apply' function to arrays. 
# For sums and means of matrix dimensions, we have some shortcuts.

rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

# The shortcut functions are much faster, but you won’t notice unless 
# you’re using a large matrix.

rowSums(x)
# Output
# [1]  0.05805677  0.95491385  1.26054831 -0.30462323 -1.17417607
# [6]  2.55947158 -3.21497916 -0.61273940 -3.89307660 -5.44694065
# [11]  2.08575233  3.61224550 -3.21497721  1.29292170  7.22442867
# [16]  2.80955616  1.82267953 -4.59853910 -1.71820255 -0.41389644

rowMeans(x)
# Output
# [1]  0.005805677  0.095491385  0.126054831 -0.030462323 -0.117417607
# [6]  0.255947158 -0.321497916 -0.061273940 -0.389307660 -0.544694065
# [11]  0.208575233  0.361224550 -0.321497721  0.129292170  0.722442867
# [16]  0.280955616  0.182267953 -0.459853910 -0.171820255 -0.041389644

colSums(x)
# Output
# [1] -5.09761869 -0.35965541 -1.11142276  9.10257979  4.02924408
# [6]  0.03658122  5.91891769 -2.63547856 -4.38821694 -6.40650644

colMeans(x)
# Output
# [1] -0.254880934 -0.017982771 -0.055571138  0.455128990  0.201462204
# [6]  0.001829061  0.295945885 -0.131773928 -0.219410847 -0.320325322



# Other Ways to Apply
# -----------------------
# Quantiles of the rows of a matrix.

# Suppose I want to calculate the 25th and 75th percentile of each row
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75)) # args for qt fn is 'probs'
#         [,1]       [,2]       [,3]       [,4]      [,5]
# 25% -1.4161382 -0.2291288 -1.3156104 -1.1503830 0.2140721
# 75% -0.0358501  1.6469666 -0.1201381 -0.1870666 1.2359325
#         [,6]       [,7]       [,8]       [,9]      [,10]
# 25% -0.3008182 -0.8682508 -0.8198132 -0.4781616 -0.8352151
# 75%  0.7780169  0.5781259 -0.1666931  1.2892349  0.5448321
#         [,11]      [,12]     [,13]      [,14]     [,15]
# 25% -0.5608359 -0.2187988 0.1001203 -0.4885617 -1.029548
# 75%  0.8084171  0.9743325 0.7751813  1.0692528  1.212876
#         [,16]      [,17]     [,18]      [,19]     [,20]
# 25% -0.3055818 -0.5430303 -0.2375083 -0.3772001 -0.7715950
# 75%  0.7178489  0.5323474  0.5888115  0.2638007  0.2122373

y <- apply(x, 1, quantile, probs = c(0.25, 0.75)) 
# this returns a matrix of (2x20) dimension with 25 and 75% value of the data
dim(y) # check to see if the dimensions are correct
# [1]  2 20


# apply
# ------------
# Average matrix in an array

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
# bunch (2x2) matrices stacked together
# want to calculate the avg of the matrices and collapse the 3rd dimension
# the 'avg' matrix is also gonna be a 2x2 matrix

apply(a, c(1, 2), mean)
# Output
#           [,1]        [,2]
# [1,] -0.07350300 -0.04603494
# [2,]  0.04755602 -0.21728328

rowMeans(a, dims = 2) # does the same thing as the previous command
# Output
#           [,1]        [,2]
# [1,] -0.07350300 -0.04603494
# [2,]  0.04755602 -0.21728328