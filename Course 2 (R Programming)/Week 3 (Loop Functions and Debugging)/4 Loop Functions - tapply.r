# tapply
# ---------------------

# tapply is used to apply a function over subsets of a vector. I don’t know 
# why it’s called tapply.

# I might have a vector of numbers and I might want to calculate summary 
# statistic over some pieces of that vector. I can use tapply to calculate
# mean, sd, etc. of that vector. 

str(tapply)
# function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE) 

# X is a vector
# INDEX is a factor or a list of factors (or else they are coerced to factors)
# FUN is a function to be applied
# ... contains other arguments to be passed FUN
# simplify, should we simplify the result?

# First argument is a numeric vector or a vector of some sort. The second 
# argument is, is another vector of the same length which identifies which 
# group each element of the numeric vector is in.

# So for example, suppose there are two groups : first 50 observations are men 
# and the second 50 observations are women. Then you need to have a factor 
# variable which indicates which observations are men and which are women.



# Take group means
# -----------------
x <- c(rnorm(10), runif(10), rnorm(10, 1))
x
# Output
# [1]  0.67319167  0.08981836  0.43774540  1.06421007  1.40680234
# [6] -0.23590265  1.70684982  0.77878538 -0.39026036 -1.33609620
# [11]  0.01002986  0.56988569  0.25802865  0.23121281  0.81653201
# [16]  0.35879531  0.95498914  0.75751473  0.33377607  0.79274695
# [21]  3.15394476  0.73791949  2.32574894 -0.50824473 -0.26084309
# [26]  1.57887071 -0.14732951  0.61424992  0.16659409  1.37158570

# Simulating a vector of normal random variables and uniform random variables 
# and, and there's ten normals, ten uniforms, then ten normals that have a 
# mean of one. So you can think of this vector as having three groups.

f <- gl(3, 10)
f
# Output
# [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
# Levels: 1 2 3

# Creating a factor variable using the gl function and this factor variable 
# is going to have three levels, each level is going to be repeated ten times.

tapply(x, f, mean)
# Output
#         1         2         3 
# 0.4195144 0.5083511 0.9032496 

# calculates the mean of each group of functions



# Take group means without simplification (gives us a list)
# ----------------------------------------

tapply(x, f, mean, simplify = FALSE)
# Output
# $`1`
# [1] 0.4195144
# 
# $`2`
# [1] 0.5083511
# 
# $`3`
# [1] 0.9032496

 

# Find group ranges
# -------------------

# I can also use slightly complicated summary statistic functions. 

tapply(x, f, range)
# Output
# $`1`
# [1] -0.9379925  1.7367674
# 
# $`2`
# [1] 0.04925588 0.85510841
# 
# $`3`
# [1] -0.2436976  2.6523578

# Here each element is a vector of length 2.