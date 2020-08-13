# apply
# ----------------

# apply is used to a evaluate a function (often an anonymous one) over the 
# margins of an array. It is most often used to apply a function to the rows 
# or columns of a matrix. It can be used with general arrays, e.g. taking 
# the average of an array of matrices. It is not really faster than writing 
# a loop, but it works in one line!
  
str(apply)
# function (X, MARGIN, FUN, ...)  

# X is an array
# MARGIN is an integer vector indicating which margins should be “retained”.
# FUN is a function to be applied
# ... is for other arguments to be passed to FUN


x <- matrix(rnorm(200), 20, 10)

apply(x, 2, mean)
# Output
# [1]  0.041597801 -0.007965326 -0.067736108 -0.442325546 -0.319348298
# [6] -0.160523432  0.054901735  0.037705261 -0.157675375  0.164261296

apply(x, 1, sum)
# Output
# [1]  -5.4715707  -0.2029979   5.6390271   2.9712664  -4.7227922
# [6]  -4.6296715  -3.4401373   0.7085447   7.1666165   3.7750684
# [11]  -2.2374511  -0.3080558  -2.0090229  -6.1822947  -0.9802599
# [16] -10.4664555  -0.1741214   1.2001970   1.2206894   1.0012615



# col/row sums and means
# --------------------------
# For sums and means of matrix dimensions, we have some shortcuts.

rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

# The shortcut functions are much faster, but you won’t notice unless 
# you’re using a large matrix.

rowSums
# Output
# [1]  -5.4715707  -0.2029979   5.6390271   2.9712664  -4.7227922
# [6]  -4.6296715  -3.4401373   0.7085447   7.1666165   3.7750684
# [11]  -2.2374511  -0.3080558  -2.0090229  -6.1822947  -0.9802599
# [16] -10.4664555  -0.1741214   1.2001970   1.2206894   1.0012615

rowMeans
# Output
# [1] -0.54715707 -0.02029979  0.56390271  0.29712664 -0.47227922
# [6] -0.46296715 -0.34401373  0.07085447  0.71666165  0.37750684
# [11] -0.22374511 -0.03080558 -0.20090229 -0.61822947 -0.09802599
# [16] -1.04664555 -0.01741214  0.12001970  0.12206894  0.10012615

colSums
# Output
# [1]  0.8319560 -0.1593065 -1.3547222 -8.8465109 -6.3869660
# [6] -3.2104686  1.0980347  0.7541052 -3.1535075  3.2852259

colMeans
# Output
# [1]  0.041597801 -0.007965326 -0.067736108 -0.442325546
# [5] -0.319348298 -0.160523432  0.054901735  0.037705261
# [9] -0.157675375  0.164261296



# Other Ways to Apply
# -----------------------
# Quantiles of the rows of a matrix.


x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))
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


# apply
# ------------
# Average matrix in an array


a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))

apply(a, c(1, 2), mean)
# Output
#           [,1]        [,2]
# [1,] -0.07350300 -0.04603494
# [2,]  0.04755602 -0.21728328

rowMeans(a, dims = 2)
# Output
#           [,1]        [,2]
# [1,] -0.07350300 -0.04603494
# [2,]  0.04755602 -0.21728328