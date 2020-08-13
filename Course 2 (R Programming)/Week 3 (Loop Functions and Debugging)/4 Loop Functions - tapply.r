# tapply
# ---------------------

# tapply is used to apply a function over subsets of a vector. I don’t know 
# why it’s called tapply.


str(tapply)
# function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE) 

# X is a vector
# INDEX is a factor or a list of factors (or else they are coerced to factors)
# FUN is a function to be applied
# ... contains other arguments to be passed FUN
# simplify, should we simplify the result?


# Take group means
# -----------------
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)

f
# Output
# [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
# Levels: 1 2 3

tapply(x, f, mean)
# Output
#       1           2           3 
# -0.03717879  0.52858023  1.12754822 



# Take group means without simplification.
# ----------------------------------------

tapply(x, f, mean, simplify = FALSE)
# Output
# $`1`
# [1] -0.03717879
# 
# $`2`
# [1] 0.5285802
# 
# $`3`
# [1] 1.127548

 

# Find group ranges
# -------------------

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