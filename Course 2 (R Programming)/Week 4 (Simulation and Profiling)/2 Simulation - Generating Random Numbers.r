# Generating Random Numbers
# ---------------------------

# Functions for probability distributions in R
# -----------------------------------------------
# rnorm: generate random Normal variates with a given mean 
# and standard deviation

# dnorm: evaluate the Normal probability density (with a given mean/SD) 
# at a point (or vector of points)

# pnorm: evaluate the cumulative distribution function for a Normal distribution

# rpois: generate random Poisson variates with a given rate

# Page 2

# Probability distribution functions usually have four functions associated 
# with them. The functions are prefixed with a:

# d for density
# r for random number generation
# p for cumulative distribution
# q for quantile function

# Page 3 

# Working with the Normal distributions requires using these four functions

dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)

# If Φ is the cumulative distribution function for a standard Normal 
# distribution, then pnorm(q) = Φ(q) and qnorm(p) = Φ^−1 (p)

x <- rnorm(10)
x
# Output
# [1]  1.43506957 -0.71037115 -0.06506757 -1.75946874
# [5]  0.56972297  1.61234680 -1.63728065 -0.77956851
# [9] -0.64117693 -0.68113139

x <- rnorm(10, 20, 2)
x
# Output
# [1] 15.93343 21.00193 16.93640 19.95000 21.18597 19.60361
# [7] 21.78402 19.94857 18.70468 21.29272

summary(x)
# Output
# Min.   1st Qu. Median   Mean   3rd Qu.    Max. 
# 15.93   18.93   19.95   19.63   21.14   21.78 


# Setting the random number seed with set.seed ensures reproducibility

set.seed(1)
rnorm(5)
# [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

rnorm(5)
# [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884

set.seed(1)
rnorm(5)
# [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

# Always set the random number seed when conducting a simulation!


# Generating Poisson data
# -----------------------
rpois(10, 1)
# [1] 2 1 0 0 0 0 1 1 1 2

rpois(10, 2)
# [1] 1 2 1 2 1 2 3 0 4 1

rpois(10, 20)
# [1] 24 18 25 18 27 22 17 22 16 13

ppois(2, 2) ## Cumulative distribution
# [1] 0.6766764

ppois(4, 2)
# [1] 0.947347

ppois(6, 2)
# [1] 0.9954662

 
# Generating Random Numbers From a Linear Model
# ----------------------------------------------

# Suppose we want to simulate from the following linear model
# y = β0 + β1x + ε

# where, 
# ε ∼ N (0, 2^2)
# Assume, x ∼  N (0, 1^2), β0 = 0.5, and β1 = 2

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e

summary(y)
#     Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -6.4084 -1.5402  0.6789  0.6893  2.9303  6.5052 

plot(x, y)
# plot can be seen in the plot window



# What if x is binary?
# ----------------------

set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e

summary(y)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -3.4936 -0.1409  1.5767  1.4322  2.8397  6.9410 

plot(x, y)
# plot can be seen in the plot window


# Generating Random Numbers From a Generalized Linear Model
# ----------------------------------------------------------

# Suppose we want to simulate from a Poisson model where

# Y ~ Poisson(μ)
# log μ = β0 + β1x
# β0 = 0.5 and β1 = 0.3

# We need to use the rpois function for this

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))

summary(y)
# Min.   1st Qu. Median   Mean   3rd Qu.  Max. 
# 0.00    1.00    1.00    1.55    2.00    6.00 

plot(x, y)


# Random Sampling
# -----------------

# The sample function draws randomly from a specified set of (scalar) objects 
# allowing you to sample from arbitrary distributions.

set.seed(1)

sample(1:10, 4)
# [1] 3 4 5 7

sample(1:10, 4)
# [1] 3 9 8 5

sample(letters, 5)
# [1] "q" "b" "e" "x" "p"

sample(1:10) ## permutation
#  [1]  4  7 10  6  9  2  8  3  1  5

sample(1:10)
#  [1]  2  3  4  1  9  5 10  8  6  7

sample(1:10, replace = TRUE) ## Sample w/replacement
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