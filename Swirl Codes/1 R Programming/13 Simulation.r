# -----------------------------------------------------
# Chapter 13: Simulation 

# One of the great advantages of using a statistical programming language like 
# R is its vast collection of tools for simulating random numbers.

# This lesson assumes familiarity with a few common probability distributions, 
# but these topics will only be discussed with respect to random number 
# generation. Even if you have no prior experience with these concepts, you 
# should be able to complete the lesson and understand the main ideas.

# The first function we'll use to generate random numbers is sample().
# Use ?sample to pull up the documentation.

?sample

# Let's simulate rolling four six-sided dice: sample(1:6, 4, replace = TRUE)   

sample(1:6, 4, replace = TRUE)
# [1] 3 1 2 4

# Now repeat the command to see how your result differs. (The
# probability of rolling the exact same result is (1/6)^4 = 0.00077,
# which is pretty small!)

sample(1:6, 4, replace = TRUE)
# [1] 1 1 5 2

# sample(1:6, 4, replace = TRUE) instructs R to randomly select four numbers 
# between 1 and 6, WITH replacement. Sampling with replacement simply means 
# that each number is "replaced" after it is selected, so that the same number 
# can show up more than once. This is what we want here, since what you roll on 
# one die shouldn't affect what you roll on any of the others.

# Now sample 10 numbers between 1 and 20, WITHOUT replacement. To sample
# without replacement, simply leave off the 'replace' argument.

sample(1:20, 10)
#  [1]  4  3 14  1 19 10 15 18  7 13

# Since the last command sampled without replacement, no number appears
# more than once in the output.

# LETTERS is a predefined variable in R containing a vector of all 26
# letters of the English alphabet. Take a look at it now.

LETTERS
# Output
#  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q"
# [18] "R" "S" "T" "U" "V" "W" "X" "Y" "Z"

# The sample() function can also be used to permute, or rearrange, the elements 
# of a vector. For example, try sample(LETTERS) to permute all 26 letters of 
# the English alphabet.

sample(LETTERS)
# Output
#  [1] "J" "Y" "O" "U" "M" "Z" "N" "B" "D" "C" "G" "X" "A" "R" "F" "I" "Q"
# [18] "K" "H" "T" "E" "P" "S" "V" "L" "W"

# This is identical to taking a sample of size 26 from LETTERS, without 
# replacement. When the 'size' argument to sample() is not specified, R takes a 
# sample equal in size to the vector from which you are sampling.

# Now, suppose we want to simulate 100 flips of an unfair two-sided coin. This 
# particular coin has a 0.3 probability of landing 'tails' and a 0.7 
# probability of landing 'heads'.

# Let the value 0 represent tails and the value 1 represent heads. Use sample() 
# to draw a sample of size 100 from the vector c(0,1), with replacement. Since 
# the coin is unfair, we must attach specific probabilities to the values 0 
# (tails) and 1 (heads) with a fourth argument, prob = c(0.3, 0.7). Assign the 
# result to a new variable called flips.

flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))

# View the contents of the flips variable.

flips
# Output
#   [1] 1 1 1 1 0 1 1 1 0 0 1 1 0 0 1 0 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 0 0 1
#  [35] 0 1 0 1 1 1 1 0 1 1 1 1 1 1 0 1 0 1 1 1 1 1 0 1 1 0 0 1 1 0 1 0 1 0
#  [69] 1 1 1 1 1 1 1 1 0 1 1 0 0 1 1 1 1 1 1 1 1 0 1 0 1 0 0 1 1 1 1 1

# Since we set the probability of landing heads on any given flip to be 0.7, 
# we'd expect approximately 70 of our coin flips to have the value 1. Count the 
# actual number of 1s contained in flips using the sum() function.

sum(flips)
# [1] 73

# A coin flip is a binary outcome (0 or 1) and we are performing 100 independent 
# trials (coin flips), so we can use rbinom() to simulate a binomial random 
# variable. Pull up the documentation for rbinom() using ?rbinom.

?rbinom

# Each probability distribution in R has an r*** function (for "random"), a 
# d*** function (for "density"), a p*** (for "probability"), and q*** 
# (for "quantile"). We are most interested in the r*** functions in this 
# lesson, but I encourage you to explore the others on your own.

# A binomial random variable represents the number of 'successes' (heads) in a 
# given number of independent 'trials' (coin flips). Therefore, we can generate 
# a single random variable that represents the number of heads in 100 flips of 
# our unfair coin using rbinom(1, size = 100, prob = 0.7). Note that you only 
# specify the probability of 'success' (heads) and NOT the probability of 
# 'failure' (tails). 

rbinom(1, size = 100, prob = 0.7)
# [1] 75

# Equivalently, if we want to see all of the 0s and 1s, we can request 100 
# observations, each of size 1, with success probability of 0.7. Give it a try, 
# assigning the result to a new variable called flips2.

flips2 <- rbinom(100, size = 1, prob = 0.7)

# View the contents of flips2.

flips2
# Output
# [1] 1 1 0 1 1 0 1 1 0 1 1 1 1 0 1 0 1 1 1 1 0 0 0 0 0 1 0 0 1 0 0 0 1 0
# [35] 1 0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 0 1 1 1 1 1 1 1
# [69] 1 0 1 0 1 1 1 1 1 0 1 1 0 0 1 1 0 1 0 0 1 1 1 1 1 0 1 1 1 0 1 0

# Now use sum() to count the number of 1s (heads) in flips2. 
# It should be close to 70!

sum(flips2)
# [1] 68

# Similar to rbinom(), we can use R to simulate random numbers from many other 
# probability distributions. Pull up the documentation for rnorm() now.

?rnorm

# The standard normal distribution has mean 0 and standard deviation 1. As you 
# can see under the 'Usage' section in the documentation, the default values for 
# the 'mean' and 'sd' arguments to rnorm() are 0 and 1, respectively. Thus, 
# rnorm(10) will generate 10 random numbers from a standard normal distribution. 

rnorm(10)
# Output
# [1] -0.3511606  0.7167607 -0.2088030  1.2765002 -1.1883914 -1.7137380
# [7] -1.9561878 -1.3176539  0.4809290  0.1418312

# Now do the same, except with a mean of 100 and a standard deviation of 25.

rnorm(10, 100, 25)
# Output
# [1] 112.56164  90.81792  74.54064 117.71337 136.67472 130.81112
# [7]  57.27524 114.54598 109.10174 137.80584

# Finally, what if we want to simulate 100 *groups* of random numbers, each
# containing 5 values generated from a Poisson distribution with mean 10? Let's 
# start with one group of 5 numbers, then I'll show you how to repeat the 
# operation 100 times in a convenient and compact way.

# Generate 5 random values from a Poisson distribution with mean 10.
# Check out the documentation for rpois() if you need help.

rpois(5, 10)
# [1] 5 9 7 7 7

# Now use replicate(100, rpois(5, 10)) to perform this operation 100
# times. Store the result in a new variable called my_pois.

my_pois <- replicate(100, rpois(5, 10))

# Take a look at the contents of my_pois.

my_pois
# Output
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
# [1,]   13   15   14    9   13   13    9    8   15    13    11    10
# [2,]    9    7   17   14   10   11    7    7   13    13     5     9
# [3,]    5    3   11   12   10    7   16   15    5    11    10    16
# [4,]    8    6   16    5   10    8   11   13    6    11     9     9
# [5,]   15    6    6   11    8   13   10   10    9     9     9     7
#      [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22] [,23]
# [1,]     7     8     7    12    12    11    10     9     3     9    12
# [2,]    13    10     5     7     9    12     5     7     8    10    11
# [3,]    12    14     4    13    10    12    12     5    13    10    16
# [4,]    12    10    20    18    14    14     7    15     9    16    10
# [5,]    13    11     8     7     8    13     7     8     8     5     9
#      [,24] [,25] [,26] [,27] [,28] [,29] [,30] [,31] [,32] [,33] [,34]
# [1,]    10     8    15    10     7     8     8     8    12     7     8
# [2,]    11     4     9     7     8    14    12     4     7    11    11
# [3,]     6    10    15     6     7     6     8     9    10    13    10
# [4,]     6     7     8    17    12    12    22     8     8     9    19
# [5,]    16     7     7     9    11    10    12     5    11    10     8
#      [,35] [,36] [,37] [,38] [,39] [,40] [,41] [,42] [,43] [,44] [,45]
# [1,]    13     6    11    11     5     7     9     8    12    13     9
# [2,]     7    18     3     7     7     6     8    14    10     9     9
# [3,]    16     8    15    11    13     4     6     7     5    10    10
# [4,]     8     7    14    11    12    13    11     6     8    12     5
# [5,]     8    10     3    11     9     5    11    12     7    10     5
#      [,46] [,47] [,48] [,49] [,50] [,51] [,52] [,53] [,54] [,55] [,56]
# [1,]    15     8    13     5    17    14     9    10     7     8    11
# [2,]    10    12    10     8    13     8    12    14    11    11     9
# [3,]    12    13    11     8    11     9     8    14    10    15     7
# [4,]     7    13     3    11    11    11     7    10    11    12    11
# [5,]     8    12     6     6     9    13     6    12    10     9     9
#      [,57] [,58] [,59] [,60] [,61] [,62] [,63] [,64] [,65] [,66] [,67]
# [1,]     8     6     7     8     6    11    12    10     4    12     7
# [2,]     9    13    10     7    10     9     9    12    14     5    10
# [3,]     6    12    11    13     9    12    10    11    13    12     5
# [4,]    11    12     7    11     9    11    16    13     5     9     6
# [5,]     9    11    12     9     6     8     8    17     9    10    13
#      [,68] [,69] [,70] [,71] [,72] [,73] [,74] [,75] [,76] [,77] [,78]
# [1,]    10    12    11    15     8    15    16     9    10    20     4
# [2,]    12    11     4    10    16     7    13     8     7     8     6
# [3,]    13     8     8     9     8    12    12    10    11     4    14
# [4,]     9    11     9     8    12    11    14    10     9     7    16
# [5,]     9     7     5    12    10    11    11    12    10    14    14
#      [,79] [,80] [,81] [,82] [,83] [,84] [,85] [,86] [,87] [,88] [,89]
# [1,]    11     8     7    10    11    14     8    11     7     8    15
# [2,]    13    10     8    12    13    10    13    14    11     7    12
# [3,]    11    12     9     9     9     8    15     8    10     5     9
# [4,]    13    14    13    12    11    19    11    10     8    10     6
# [5,]    11    13     7    10    14     8    12     8     7    12    15
#      [,90] [,91] [,92] [,93] [,94] [,95] [,96] [,97] [,98] [,99] [,100]
# [1,]     5    10     8     7     6     8    15    14    11    10     15
# [2,]    10    10    13     9    14     8    12    12     6    13      5
# [3,]     9    12     6     8     4     7    13    10    12     8      8
# [4,]     9     9     9     6    11    13    14     6     8     6     12
# [5,]    13    10     9     7     9     5    12    13    13    10     11


# replicate() created a matrix, each column of which contains 5 random numbers 
# generated from a Poisson distribution with mean 10. Now we can find the mean 
# of each column in my_pois using the colMeans() function. Store the result in 
# a variable called cm.

cm <- colMeans(my_pois)

# And let's take a look at the distribution of our column means by
# plotting a histogram with hist(cm).

hist(cm)
# look > 13 Simulation figure 1 

# Looks like our column means are almost normally distributed, right? That's 
# the Central Limit Theorem at work, but that's a lesson for another day!

# All of the standard probability distributions are built into R, including 
# exponential (rexp()), chi-squared (rchisq()), gamma (rgamma()), .... 
# Well, you see the pattern.

# Simulation is practically a field of its own and we've only skimmed
# the surface of what's possible. I encourage you to explore these and
# other functions further on your own.