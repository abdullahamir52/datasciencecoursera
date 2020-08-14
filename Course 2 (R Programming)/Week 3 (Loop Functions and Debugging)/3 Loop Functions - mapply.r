# mapply
# ---------------------

# mapply is a multivariate apply of sorts which applies a function in parallel 
# over a set of arguments.

# For instance, we can only use a single list as an argument in lapply and 
# sapply. What if we want to use multiple lists/vectors and apply a function
# to those objects? We can use a for loop where the for loop will index the 
# elements of each of the different lists. Or we can use the mapply. 

# Condition: Number of args the function takes has to be at least as many 
# as the number of lists within mapply.

str(mapply)
# function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE) 

# FUN is a function to apply
# ... contains arguments to apply over
# MoreArgs is a list of other arguments to FUN.
# SIMPLIFY indicates whether the result should be simplified


# mapply (contd.)
# The following is tedious to type
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
# Output
# [[1]]
# [1] 1 1 1 1
# 
# [[2]]
# [1] 2 2 2
# 
# [[3]]
# [1] 3 3
# 
# [[4]]
# [1] 4


# Instead we can do
mapply(rep, 1:4, 4:1)
# Output
# [[1]]
# [1] 1 1 1 1
# 
# [[2]]
# [1] 2 2 2
# 
# [[3]]
# [1] 3 3
# 
# [[4]]
# [1] 4



# Vectorizing a Function (generates some random normal noise)
# ------------------------------------------------------------
noise <- function(n, mean, sd) 
  {
    rnorm(n, mean, sd)
  }
# n     = number of obs
# mean  = value of the mean
# sd    = value of the standard deviation

noise(5, 1, 2)
# Output
# [1] -1.5809945 -0.8601625 -0.9740305  2.7608355 -2.2720245
# Or
# [1] -5.0106501  1.0511306  0.6218588 -0.8802973  0.6745357

noise(1:5, 1:5, 2) # not works with a vector of arguments. see below
# Output
# [1]  0.56066271 -0.08009486  3.38589957  2.88952750 5.54998178
# Or
# [1] 1.074713 6.361667 2.840830 6.752590 8.150633

# What I want to have is one random normal with mean 1, two random normals 
# with mean 2, three random normals with mean 3, etc, and then five random 
# normals with mean 5.


# Instant Vectorization
# ----------------------

mapply(noise, 1:5, 1:5, 2)
# Output
# [[1]]
# [1] 2.264323
# 
# [[2]]
# [1] -0.05351147 -0.31719546
# 
# [[3]]
# [1] -1.151527  1.020959  4.165155
# 
# [[4]]
# [1] 3.907000 1.369469 3.833469 3.492890
# 
# [[5]]
# [1] 3.751370 6.303556 6.741944 3.799147 5.635567


# Which is the same as
list(noise(1, 1, 2), noise(2, 2, 2),
     noise(3, 3, 2), noise(4, 4, 2),
     noise(5, 5, 2))
# Output
# [[1]]
# [1] 4.021776
# 
# [[2]]
# [1] -0.9477724  1.7838555
# 
# [[3]]
# [1] 1.929739 3.777856 2.048152
# 
# [[4]]
# [1] 3.807770 7.024827 4.638591 5.441814
# 
# [[5]]
# [1] 7.628596 4.933261 4.325802 4.440892 5.996562