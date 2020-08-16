# Random Sampling
# -----------------

# The sample function allows you to draw randomly from a specific set of 
# objects that you specify. So if you give it a vector of numbers, it allows 
# you to draw a random sample from that vector of numbers. And so you can 
# kind of create any arbitrary distribution that you want, by specifying a 
# vector of objects and then sampling from it.


# The sample function draws randomly from a specified set of (scalar) objects 
# allowing you to sample from arbitrary distributions.

set.seed(1)

sample(1:10, 4) # I want 4 values from (0,10) without replacement
# [1] 3 4 5 7

sample(1:10, 4)
# [1] 3 9 8 5

sample(letters, 5)
# [1] "q" "b" "e" "x" "p"

sample(1:10) # permutation of those 10 numbers
#  [1]  4  7 10  6  9  2  8  3  1  5

sample(1:10)
#  [1]  2  3  4  1  9  5 10  8  6  7

sample(1:10, replace = TRUE) # Sample with replacement
#  [1] 2 9 7 8 2 8 5 9 7 8



# Simulation
# Summary
# -------------------

# Drawing samples from specific probability distributions can be done 
# with r* functions.

# Standard distributions are built in: Normal, Poisson, Binomial, 
# Exponential, Gamma, etc.

# The sample function can be used to draw random samples from arbitrary vectors.

# Setting the random number generator seed via set.seed is critical 
# for reproducibility.