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
# distribution, then pnorm(q) = Φ(q) and qnorm(p) = Φ^−1 (p) (inverse of phi)

# All the functions have required that you specify the mean and the standard 
# deviation, because that's what specifies the actual probability distribution. 
# If you do not specify them, then the default values of a standard normal 
# distribution are mean zero and standard deviation one.

# For the dnorm function you can evaluate the density. And there's an option 
# that allows you to evaluate the log of the density. Most of the time, when you 
# evaluate the density function for a normal distribution, you're going to want 
# to use the log of that value.

# For the pnorm function and the qnorm function there's also an option to 
# evaluate it on a log scale, but another option is to evaluate, is whether or 
# not you want to evaluate the lower tail of the distribution. So the lower 
# tail, which is the default, is the part that goes to the left. It's the lower 
# tail. If you want to evaluate the upper tail, sometimes you want to do this. 
# Then you want to say lower tail equals false, and that will evaluate the 
# upper tail of the distribution. 

# And finally for rnorm, there's only two parameters, mean and standard 
# deviation, and an n, which is the number of random variables that you want 
# to generate. So if n is 100, you'll get a vector of 100 numbers that are 
# drawn from the, from the normal distribution


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
# ---------------------------------------------------------------------

# So any time you simulate random numbers from any distribution for any purpose, 
# it's very important that you set the random number generator seed. And this 
# can be done with the 'set.seed' function. So on computers when you generate 
# random numbers, the numbers are not actually random but they appear random 
# and they're what are called pseudo random numbers. And if you wanted to 
# generate the same set of random numbers again, you could if you wanted to 
# because the numbers are not actually random. And so here I'm setting the 
# seed to be one. So the seed can be any integer you want. Then once you need 
# those numbers again, just set the seed back to the original number and it 
# will generate the same numbers again. 

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
# generating 10 poisson data with the rate of one (rate=mean)
# poisson data are integers

rpois(10, 2)
# [1] 1 2 1 2 1 2 3 0 4 1

rpois(10, 20)
# [1] 24 18 25 18 27 22 17 22 16 13

ppois(2, 2) ## Cumulative distribution
# [1] 0.6766764

# What is the probability that a Poisson random variable is less than or equal 
# to two if the rate is two. And so this is the probability. It's 0.67.


ppois(4, 2)
# [1] 0.947347

# If I wanted to know what's the probability that a Poisson random variable 
# with rate two is less than or equal to four. You can see the probability's 
# getting bigger. 

ppois(6, 2)
# [1] 0.9954662

# And here I can see the probability that a Poisson random variable is less 
# than six. Less than or equal to six, and it's very close to one.