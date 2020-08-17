# My solve
# -------------

# Question 1
# --------------

# What is produced at the end of this snippet of R code?
  
set.seed(1)
rpois(5, 2)

# 1. It is impossible to tell because the result is random
# 2. A vector with the numbers 1, 4, 1, 1, 5
# 3. A vector with the numbers 1, 1, 2, 4, 1
# 4. A vector with the numbers 3.3, 2.5, 0.5, 1.1, 1.7

# Answer : 3


# Question 2
# --------------

# What R function can be used to generate standard Normal random variables?

# dnorm
# qnorm
# pnorm
# rnorm

# Answer : rnorm


# Question 3
# --------------

# When simulating data, why is using the set.seed() function important? 
# Select all that apply.

# 1. It ensures that the sequence of random numbers is truly random.
# 2. It can be used to generate non-uniform random numbers.
# 3. It ensures that the random numbers generated are within specified boundaries.
# 4. It ensures that the sequence of random numbers starts in a specific place and is therefore reproducible.

# Answer : 4


# Question 4
# --------------

# Which function can be used to evaluate the inverse cumulative distribution 
# function for the Poisson distribution?

# qpois
# ppois
# rpois
# dpois

# Answer : qpois

# Explanation
# Probability distribution functions beginning with the q prefix are used to 
# evaluate the quantile function.


# Question 5
# --------------

# What does the following code do?

set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

# 1. Generate data from a Normal linear model
# 2. Generate data from a Poisson generalized linear model
# 3. Generate random exponentially distributed data
# 4. Generate uniformly distributed random data

# Answer : 1


# Question 6
# --------------

# What R function can be used to generate Binomial random variables?

# pbinom
# rbinom
# dbinom
# qbinom

# Answer : rbinom


# Question 7
# --------------

# What aspect of the R runtime does the profiler keep track of when an 
# R expression is evaluated?

# 1. the global environment
# 2. the working directory
# 3. the function call stack
# 4. the package search list

# Answer : 3

# Explanation
# When using by.total normalization, the top-level function (in this case, 
# lm()) always takes 100% of the time.


# Question 8
# --------------

# Consider the following R code

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)

# (Assume that y, x1, and x2 are present in the workspace.) Without running 
# the code, what percentage of the run time is spent in the 'lm' function, 
# based on the 'by.total' method of normalization shown in 'summaryRprof()'?

# 100%
# 50%
# It is not possible to tell
# 23%

# Answer : 100%


# Question 9
# --------------

# When using 'system.time()', what is the user time?

# 1. It is the time spent by the CPU waiting for other tasks to finish
# 2. It is the time spent by the CPU evaluating an expression
# 3. It is the "wall-clock" time it takes to evaluate an expression
# 4. It is a measure of network latency

# Answer : 2


# Question 10
# --------------

# If a computer has more than one available processor and R is able to take 
# advantage of that, then which of the following is true when using 
# 'system.time()'?

# 1. elapsed time is 0
# 2. user time is 0
# 3. elapsed time may be smaller than user time
# 4. user time is always smaller than elapsed time

# Answer : 3