# split
# ----------------------

# tapply is useful because it splits up a vector into little pieces and it 
# applies a summary statistic or function to those little pieces, and then 
# it brings the pieces back together again. 
# Split is not a loop function but it's a very handy function that can 
# be used in conjunction, with functions like lapply or sapply.

# split takes a vector or other objects and splits it into groups determined 
# by a factor or list of factors. (like tapply w/o the summary statistic)


str(split)
# function (x, f, drop = FALSE, ...)  

# x is a vector (or list) or data frame
# f is a factor (or coerced to one) or a list of factors
# drop indicates whether empty factors levels should be dropped

# e.g. if 'f' has three groups in it then split will divide 'x' in three groups
# after they are divided, then you can use lapply or sapply on them




# split
# ----------

x <- c(rnorm(10), runif(10), rnorm(10, 1)) # generates 30 values
x
# Output
# [1]  0.7865570 -0.5116050  0.4703350  1.1531930 -1.2525933
# [6] -1.0928354 -0.6636595  0.3929522 -0.2834612 -1.6789438
# [11]  0.9724822  0.5227715  0.3499984  0.2758302  0.4382841
# [16]  0.6658526  0.6999240  0.0307563  0.2975663  0.1981702
# [21]  0.4217839  2.0902724  0.3042487 -0.4346425  0.5510606
# [26]  0.9458315  1.0719350  1.1814869  0.8179337  2.1521792


f <- gl(3, 10) # creates three groups and assigns them numbers
f
# Output
# [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
# Levels: 1 2 3


split(x, f) # splits 'x' with numbers assigned in 'f'
# Output
# $`1`
# [1]  0.7865570 -0.5116050  0.4703350  1.1531930 -1.2525933
# [6] -1.0928354 -0.6636595  0.3929522 -0.2834612 -1.6789438
# 
# $`2`
# [1] 0.9724822 0.5227715 0.3499984 0.2758302 0.4382841 
# [6] 0.6658526 0.6999240 0.0307563 0.2975663 0.1981702
# 
# $`3`
# [1]  0.4217839  2.0902724  0.3042487 -0.4346425  0.5510606
# [6]  0.9458315  1.0719350  1.1814869  0.8179337  2.1521792

# split always returns a list btw.




# split
# ----------

# A common idiom is split followed by an lapply.

lapply(split(x, f), mean) # you can use tapply for this. tapply is more compact
# Output
# $`1`
# [1] -0.2680061
# 
# $`2`
# [1] 0.4451636
# 
# $`3`
# [1] 0.9102089

 


# Splitting a Data Frame
# -------------------------

library(datasets)
head(airquality)
# Output
#     Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6


# I might want to calculate the mean of different columns for a specific
# month. How do I do this? 

# Split the data frame into monthly pieces. And then calculate the means of 
# the column mean using either apply or columnmeans

# The month variable is not a factor variable but it can be converted into a 
# factor variable, because it only takes the values 5, 6, 7, 8 and 9. Basically 
# because the measurements are only taken in warmer months (May-September)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# Output
# $`5`
#     Ozone     Solar.R        Wind 
#       NA        NA         11.62258 
# 
# $`6`
#     Ozone     Solar.R        Wind 
#       NA     190.16667     10.26667 
# 
# $`7`
#     Ozone     Solar.R        Wind 
#       NA     216.483871     8.941935 
# 
# $`8`
#     Ozone     Solar.R        Wind 
#       NA        NA          8.793548 
# 
# $`9`
#     Ozone     Solar.R        Wind 
#       NA     167.4333      10.1800 

# Takes 's' dataframe that is split into lists of different months, applies an
# annonymous function that takes the colMeans of 'Ozone', 'Solar.R', 'Wind'



sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# Output
#                5         6          7        8        9
# Ozone         NA        NA         NA       NA       NA
# Solar.R       NA 190.16667 216.483871       NA 167.4333
# Wind    11.62258  10.26667   8.941935 8.793548  10.1800

# Ozone has 'NA' as a result because there are missing data points in it

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
# Output
#                 5         6          7          8         9
# Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
# Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
# Wind     11.62258  10.26667   8.941935   8.793548  10.18000

# setting na.rm = TRUE fixes the missing data points problem.



# Splitting on More than One Level
# --------------------------------

# In the past examples, we only had a single factor variable. I have split 
# the object (vector, dataframe, lists, matrices) according to the levels of
# that single factor. But we might have more than one factor. E.g. gender> it 
# has male and female. I might want to look at the combination of the levels 
# within those factors. I've got f1, which is a factor with two levels. 
# I've simulated a normal random variable with 10, with 10 observations.

x <- rnorm(10)
x
# Output
# [1] -1.17086788  0.66168507  0.30350587 -0.35339984 -0.66086266
# [6] -0.02309693 -0.88067303  1.14161416  0.02604319 -1.69109643

f1 <- gl(2, 5)
f2 <- gl(5, 2)

f1
# Output
# [1] 1 1 1 1 1 2 2 2 2 2
# Levels: 1 2

f2
# Output
# [1] 1 1 2 2 3 3 4 4 5 5
# Levels: 1 2 3 4 5

interaction(f1, f2)
# Output
# [1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
# Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5

# There are two levels in the first factor and five levels in the second factor 
# and so the total combination of 10 different levels that you can have when 
# you combine the two together. So, when I call the interaction function I get 
# another factor, that kind of concatenates the levels of one with the other, 
# and you can see that it prints out that there is a total of ten levels.



# Interactions can create empty levels
# --------------------------------

# When I use the split function I don't have to use the interaction function. 
# I can just pass it a list with the two factors and it will automatically call 
# the interaction function for me, and create that 10 level interaction factor. 
# So I can just pass the list of these two factors in it and it returns me a 
# list with the levels of the 10 different kind of interaction factor levels.

str(split(x, list(f1, f2)))
# Output
# List of 10
# $ 1.1: num [1:2] -1.171 0.662
# $ 2.1: num(0) 
# $ 1.2: num [1:2] 0.304 -0.353
# $ 2.2: num(0) 
# $ 1.3: num -0.661
# $ 2.3: num -0.0231
# $ 1.4: num(0) 
# $ 2.4: num [1:2] -0.881 1.142
# $ 1.5: num(0) 
# $ 2.5: num [1:2] 0.026 -1.691

# We don't exactly observe every single combination. And so there are some 
# empty levels here and you can see that some of these levels have nothing in 
# them. They have zero elements, whereas other levels have a number in it. 
# So, I could take this list and lapply or sapply a function over it, if I 
# wanted to. But, sometimes it's a little bit handy to not have to keep these 
# empty levels. So, the split function has an argument called drop.



# Empty levels can be dropped.
# --------------------------------

str(split(x, list(f1, f2), drop = TRUE))
# Output
# List of 6
# $ 1.1: num [1:2] -1.171 0.662
# $ 1.2: num [1:2] 0.304 -0.353
# $ 1.3: num -0.661
# $ 2.3: num -0.0231
# $ 2.4: num [1:2] -0.881 1.142
# $ 2.5: num [1:2] 0.026 -1.691

# And if you specify drop equals true, it will drop the empty levels that are 
# created by the splitting. And this can be very handy, when you're combining, 
# multiple different factors. If you're only using a single factor, then that 
# argument doesn't do anything, because you'll just use all the levels. But if 
# you have multiple factors then typically you're going to have empty levels, 
# just because you don't observe every single combination of the factors.