# mapply
# ---------------------

# mapply is a multivariate apply of sorts which applies a function in parallel 
# over a set of arguments.

str(mapply)
# function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE) 

# FUN is a function to apply
# ... contains arguments to apply over
# MoreArgs is a list of other arguments to FUN.
# SIMPLIFY indicates whether the result should be simplified


# mapply (contd.)
# The following is tedious to type
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

# Instead we can do
mapply(rep, 1:4, 4:1)
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



# Vectorizing a Function
# -----------------------
noise <- function(n, mean, sd) 
  {
    rnorm(n, mean, sd)
}

noise(5, 1, 2)
# Output
# [1] 2.958112 1.658940 4.759271 5.085798 3.657153
# Or
# [1]  1.320754 -5.506440  0.340139  1.914180 -1.608208

noise(1:5, 1:5, 2)
# Output
# [1]  0.56066271 -0.08009486  3.38589957  2.88952750 5.54998178
# Or
# [1] 1.074713 6.361667 2.840830 6.752590 8.150633



# Instant Vectorization
# ----------------------

mapply(noise, 1:5, 1:5, 2)
# Output
# [[1]]
# [1] -1.582347

# [[2]]
# [1]  3.812759 -3.591923

# [[3]]
# [1] 3.467121 2.461928 1.682910

# [[4]]
# [1] 4.126692 4.108954 4.494019 4.248071

# [[5]]
# [1] 3.929487 5.516965 7.775418 6.334341 7.994099


# Which is the same as
list(noise(1, 1, 2), noise(2, 2, 2),
     noise(3, 3, 2), noise(4, 4, 2),
     noise(5, 5, 2))
# Output
# [[1]]
# [1] 0.4502392

# [[2]]
# [1] 3.166152 3.006717

# [[3]]
# [1] 1.513505 1.366245 6.740567

# [[4]]
# [1] 2.345494 5.901425 3.467655 1.801836

# [[5]]
# [1] 1.931565 2.587380 1.099949 3.231920 6.946812