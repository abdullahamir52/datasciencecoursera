# -----------------------------------------------------
# Chapter 5: Missing Values 

# Any operation involving NA generally yields NA as the result. To illustrate, let's
# create a vector c(44, NA, 5, NA) and assign it to a variable x.
x <- c(44, NA, 5, NA) 

# Now, let's multiply x by 3.
x*3
# [1] 132  NA  15  NA

# To make things a little more interesting, let's create a vector containing 1000
# draws from a standard normal distribution with y <- rnorm(1000).
y <- rnorm(1000)

# Next, let's create a vector containing 1000 NAs with z <- rep(NA, 1000).
z <- rep(NA, 1000)

# Finally, let's select 100 elements at random from these 2000 values (combining y
# and z) such that we don't know how many NAs we'll wind up with or what positions
# they'll occupy in our final vector -- my_data <- sample(c(y, z), 100).
my_data <- sample(c(y, z), 100)

# Let's first ask the question of where our NAs are located in our data. The is.na()
# function tells us whether each element of a vector is NA. Call is.na() on my_data
# and assign the result to my_na.
my_na <- is.na(my_data)

# Now, print my_na to see what you came up with.
my_na

# [1]  T  T  T  T  T  T  T F F F F F  T  T F F  T  T  T  T  T F  T F F  T F  T 
# T F F  T  T  T F F F F  T F F  T F  T  T F F  T F  T F  T F  T  T F T F F  T 
# F F F  T  T F F F  T  T F F  T  T  T F  T  T F  T F F  T F T F F  T  T F F  
# T  T F F F  T F F  T

# In our previous discussion of logical operators, we introduced the `==` operator
# as a method of testing for equality between two objects. So, you might think the
# expression my_data == NA yields the same results as is.na(). Give it a try.
my_data == NA 
# [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
# [25] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
# [49] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
# [73] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
# [97] NA NA NA NA

# The reason you got a vector of all NAs is that NA is not really a value, but just
# a placeholder for a quantity that is not available. Therefore the logical
# expression is incomplete and R has no choice but to return a vector of the same
# length as my_data that contains all NAs.

# Don't worry if that's a little confusing. The key takeaway is to be cautious when
# using logical expressions anytime NAs might creep in, since a single NA value can
# derail the entire thing.

# So, back to the task at hand. Now that we have a vector, my_na, that has a TRUE
# for every NA and FALSE for every numeric value, we can compute the total number of
# NAs in our data.

# The trick is to recognize that underneath the surface, R represents TRUE as the
# number 1 and FALSE as the number 0. Therefore, if we take the sum of a bunch of
# TRUEs and FALSEs, we get the total number of TRUEs.

# Let's give that a try here. Call the sum() function on my_na to count the total
# number of TRUEs in my_na, and thus the total number of NAs in my_data. Don't
# assign the result to a new variable.
sum(my_na)
# [1] 50

# Pretty cool, huh? Finally, let's take a look at the data to convince ourselves
# that everything 'adds up'. Print my_data to the console.
my_data
# [1]          NA          NA          NA          NA          NA
# [6]          NA          NA -0.22745375 -1.07159983 -0.65239804
# [11] -1.22185092  0.71942924          NA          NA  0.88901103
# [16] -0.14207632          NA          NA          NA          NA
# [21]          NA -1.00349400          NA  0.19910659  1.26259993
# [26]          NA  0.54895386          NA          NA  0.96030564
# [31] -0.57209626          NA          NA          NA  0.37375932
# [36] -0.29049346  0.04181300 -0.78110094          NA  2.25621272
# [41] -0.01460178          NA  1.13546389          NA          NA
# [46]  1.45715157  1.34628286          NA -1.91537326          NA
# [51] -1.21524897          NA -0.50980397          NA          NA
# [56] -0.12438872          NA  1.97266141 -1.16585880          NA
# [61] -0.53264403  1.59033203  0.16643566          NA          NA
# [66]  1.33774874 -1.40041588 -0.28455642          NA          NA
# [71]  1.45400358 -0.48275389          NA          NA          NA
# [76]  0.37908496          NA          NA -0.07350431          NA
# [81] -1.35249022 -0.24011631          NA  0.03760834          NA
# [86] -1.45187064 -0.54159603          NA          NA -0.55922836
# [91]  0.71217843          NA          NA -1.32395873 -0.81430432
# [96] -1.01087355          NA -0.36183739 -1.15176292          NA

# Now that we've got NAs down pat, let's look at a second type of missing value --
# NaN, which stands for 'not a number'. To generate NaN, try dividing (using a
# forward slash) 0 by 0 now.
0/0
# [1] NaN

# Let's do one more, just for fun. In R, Inf stands for infinity. What happens if
# you subtract Inf from Inf?
Inf - Inf 
# [1] NaN