# -----------------------------------------------------
# Chapter 11: vapply and tapply 

# In the last lesson, you learned about the two most fundamental members
# of R's *apply family of functions: lapply() and sapply(). Both take a
# list as input, apply a function to each element of the list, then
# combine and return the result. lapply() always returns a list, whereas
# sapply() attempts to simplify the result.

# In this lesson, you'll learn how to use vapply() and tapply(), each of
# which serves a very specific purpose within the Split-Apply-Combine
# methodology. For consistency, we'll use the same dataset we used in the
# 'lapply and sapply' lesson.

# The Flags dataset from the UCI Machine Learning Repository contains
# details of various nations and their flags. More information may be
# found here: http://archive.ics.uci.edu/ml/datasets/Flags

# I've stored the data in a variable called flags. If it's been a while
# since you completed the 'lapply and sapply' lesson, you may want to
# reacquaint yourself with the data by using functions like dim(),
# head(), str(), and summary() when you return to the prompt (>). You can
# also type viewinfo() at the prompt to bring up some documentation for
# the dataset. Let's get started!

# As you saw in the last lesson, the unique() function returns a vector
# of the unique values contained in the object passed to it. Therefore,
# sapply(flags, unique) returns a list containing one vector of unique
# values for each column of the flags dataset. Try it again now.

sapply(flags, unique)

# What if you had forgotten how unique() works and mistakenly thought it
# returns the *number* of unique values contained in the object passed to
# it? Then you might have incorrectly expected sapply(flags, unique) to
# return a numeric vector, since each element of the list returned would
# contain a single number and sapply() could then simplify the result to
# a vector.

# When working interactively (at the prompt), this is not much of a
# problem, since you see the result immediately and will quickly
# recognize your mistake. However, when working non-interactively (e.g.
# writing your own functions), a misunderstanding may go undetected and
# cause incorrect results later on. Therefore, you may wish to be more
# careful and that's where vapply() is useful.

# Whereas sapply() tries to 'guess' the correct format of the result,
# vapply() allows you to specify it explicitly. If the result doesn't
# match the format you specify, vapply() will throw an error, causing the
# operation to stop. This can prevent significant problems in your code
# that might be caused by getting unexpected return values from sapply().

# Try vapply(flags, unique, numeric(1)), which says that you expect each
# element of the result to be a numeric vector of length 1. Since this is
# NOT actually the case, YOU WILL GET AN ERROR. Once you get the error,
# type ok() to continue to the next question.

vapply(flags, unique, numeric(1))
# Output
# Error in vapply(flags, unique, numeric(1)) : values must be length 1,
# but FUN(X[[1]]) result is length 194

ok()

# Recall from the previous lesson that sapply(flags, class) will return a
# character vector containing the class of each column in the dataset.
# Try that again now to see the result.

sapply(flags, class)
# Output
#        name    landmass        zone        area  population    language 
# "character"   "integer"   "integer"   "integer"   "integer"   "integer" 
#    religion        bars     stripes     colours         red       green 
#   "integer"   "integer"   "integer"   "integer"   "integer"   "integer" 
#        blue        gold       white       black      orange     mainhue 
#   "integer"   "integer"   "integer"   "integer"   "integer" "character" 
#     circles     crosses    saltires    quarters    sunstars    crescent 
#   "integer"   "integer"   "integer"   "integer"   "integer"   "integer" 
#    triangle        icon     animate        text     topleft    botright 
#   "integer"   "integer"   "integer"   "integer" "character" "character" 

# If we wish to be explicit about the format of the result we expect, we
# can use vapply(flags, class, character(1)). The 'character(1)' argument
# tells R that we expect the class function to return a character vector
# of length 1 when applied to EACH column of the flags dataset.

vapply(flags, class, character(1))
# Output
#        name    landmass        zone        area  population    language 
# "character"   "integer"   "integer"   "integer"   "integer"   "integer" 
#    religion        bars     stripes     colours         red       green 
#   "integer"   "integer"   "integer"   "integer"   "integer"   "integer" 
#        blue        gold       white       black      orange     mainhue 
#   "integer"   "integer"   "integer"   "integer"   "integer" "character" 
#     circles     crosses    saltires    quarters    sunstars    crescent 
#   "integer"   "integer"   "integer"   "integer"   "integer"   "integer" 
#    triangle        icon     animate        text     topleft    botright 
#   "integer"   "integer"   "integer"   "integer" "character" "character" 

# Note that since our expectation was correct (i.e. character(1)), the
# vapply() result is identical to the sapply() result -- a character
# vector of column classes.

# You might think of vapply() as being 'safer' than sapply(), since it
# requires you to specify the format of the output in advance, instead of
# just allowing R to 'guess' what you wanted. In addition, vapply() may
# perform faster than sapply() for large datasets. However, when doing
# data analysis interactively (at the prompt), sapply() saves you some
# typing and will often be good enough.

# As a data analyst, you'll often wish to split your data up into groups
# based on the value of some variable, then apply a function to the
# members of each group. The next function we'll look at, tapply(), does
# exactly that.

# Use ?tapply to pull up the documentation.

?tapply

# The 'landmass' variable in our dataset takes on integer values between
# 1 and 6, each of which represents a different part of the world. Use
# table(flags$landmass) to see how many flags/countries fall into each
# group.

table(flags$landmass)
# Output
#  1  2  3  4  5  6 
# 31 17 35 52 39 20 

# The 'animate' variable in our dataset takes the value 1 if a country's
# flag contains an animate image (e.g. an eagle, a tree, a human hand)
# and 0 otherwise. Use table(flags$animate) to see how many flags contain
# an animate image.

table(flags$animate)
# Output
#   0   1 
# 155  39 

# This tells us that 39 flags contain an animate object (animate = 1) and
# 155 do not (animate = 0).

# If you take the arithmetic mean of a bunch of 0s and 1s, you get the
# proportion of 1s. Use tapply(flags$animate, flags$landmass, mean) to
# apply the mean function to the 'animate' variable separately for each
# of the six landmass groups, thus giving us the proportion of flags
# containing an animate image WITHIN each landmass group.

tapply(flags$animate, flags$landmass, mean)
# Output
#         1         2         3         4         5         6 
# 0.4193548 0.1764706 0.1142857 0.1346154 0.1538462 0.3000000 

# The first landmass group (landmass = 1) corresponds to North America
# and contains the highest proportion of flags with an animate image
# (0.4194).

# Similarly, we can look at a summary of population values (in round
# millions) for countries with and without the color red on their flag
# with tapply(flags$population, flags$red, summary).

tapply(flags$population, flags$red, summary)
# Output
# $`0`
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.00    0.00    3.00   27.63    9.00  684.00 
# 
# $`1`
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    0.0     0.0     4.0    22.1    15.0  1008.0 

# What is the median population (in millions) for countries *without* the
# color red on their flag?
# 1: 0.0
# 2: 22.1
# 3: 4.0
# 4: 9.0
# 5: 3.0
# 6: 27.6
# Selection: 5

# Lastly, use the same approach to look at a summary of population values
# for each of the six landmasses.

tapply(flags$population, flags$landmass, summary)
# Output
# $`1`
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.00    0.00    0.00   12.29    4.50  231.00 
# $`2`
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.00    1.00    6.00   15.71   15.00  119.00 
# $`3`
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.00    0.00    8.00   13.86   16.00   61.00 
# $`4`
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.000   1.000   5.000   8.788   9.750  56.000 
# $`5`
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.00    2.00   10.00   69.18   39.00 1008.00 
# $`6`
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.00    0.00    0.00   11.30    1.25  157.00 

# What is the maximum population (in millions) for the fourth landmass
# group (Africa)?
# 1: 119.0
# 2: 157.00
# 3: 56.00
# 4: 5.00
# 5: 1010.0
# Selection: 3

# In this lesson, you learned how to use vapply() as a safer alternative
# to sapply(), which is most helpful when writing your own functions. You
# also learned how to use tapply() to split your data into groups based
# on the value of some variable, then apply a function to each group.
# These functions will come in handy on your quest to become a better
# data analyst.