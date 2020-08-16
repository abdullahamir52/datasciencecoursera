# Generating Random Numbers From a Linear Model
# ----------------------------------------------

# Suppose we want to simulate from the following linear model
# y = β0 + β1x + ε

# where, 
# ε ∼ N (0, 2^2) # mean = 0, variance = 4, sd = 2
# Assume, x ∼  N (0, 1^2), β0 = 0.5, and β1 = 2

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e

summary(y)
#     Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -6.4084 -1.5402  0.6789  0.6893  2.9303  6.5052 

plot(x, y)
# plot can be seen in the plot window (3 Simulation - Plot 1)



# What if x is binary? (random variable)
# ----------------------------------------

# use the binomial distribution function

set.seed(10)
x <- rbinom(100, 1, 0.5) # n = 1, p = 0.5 (prob of 1 is equal to 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e

summary(y)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -3.4936 -0.1409  1.5767  1.4322  2.8397  6.9410 

plot(x, y)
# plot can be seen in the plot window (3 Simulation - Plot 2)

# x variable is binary but y variable is continuous




# Generating Random Numbers From a Generalized Linear Model
# ----------------------------------------------------------

# I might want to simulate some outcome data that are count variables, instead 
# of continuous variable. So we have to use a slightly more complicated 
# approach, to do this in particular, because the error distribution is not 
# going to be normal. It's going to be a a Poisson distribution.

# Suppose we want to simulate from a Poisson model where

# Y ~ Poisson(μ) (outcome y is a poisson dist. with mean μ)
# log μ = β0 + β1x
# β0 = 0.5 and β1 = 0.3

# How do we simulate from this model to get our Poisson on data? So we need to 
# use the rpois function for this. And so we first set the seed as always, and 
# we generate our predictor variable, x. Which is going to have a standard 
# normal distribution. Then we're going to simulate, generate our linear 
# predictor log of mu. Which is just adding the slope and the intercept and 
# the slope coefficient times x. So that's the log of our linear predictor. 
# But in order to get the mean for our Poisson random variable, we need to 
# exponentiate that. So we simulate 100 of these Poisson random variables 
# using the rpois function, and we give it the exponential of our log mean.

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))

summary(y)
# Min.   1st Qu. Median   Mean   3rd Qu.  Max. 
# 0.00    1.00    1.00    1.55    2.00    6.00 

plot(x, y)
# plot can be seen in the plot window (3 Simulation - Plot 3)

# So when we summarize this, you'll see that the mean is about 1.5 and our 
# range is between zero and six. When I plot this data, you'll see that they 
# look like Poisson data, and that there's clearly a linear relationship
# between x and y, as x increases, the count for y generally gets larger. 
# But the data are still count variables here.