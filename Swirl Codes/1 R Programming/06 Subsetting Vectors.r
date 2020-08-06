# -----------------------------------------------------
# Chapter NUMBER 6: R Programming Subsetting Vectors 

# In this lesson, we'll see how to extract elements from a vector based on some
# conditions that we specify.

# For example, we may only be interested in the first 20 elements of a vector, or
# only the elements that are not NA, or only those that are positive or correspond
# to a specific variable of interest. By the end of this lesson, you'll know how to
# handle each of these scenarios.
x <- c(-0.58509601, NA, NA, NA, -0.34577076, -0.02044906, 1.44509502,
       0.27292469, NA, NA, -0.32843572, NA, NA, 0.49251228, -0.46553166, 
       NA, -0.09544577, -0.79863018, NA, 0.52265533, NA, NA, -1.59580150,
       NA, NA, NA, -0.55158946, NA, -0.39053555, NA, 0.12161582, NA,
       1.60741751, 1.73837257, 0.01000722, NA, 0.92222111, 0.97939285,
       NA, NA)

# I've created for you a vector called x that contains a random ordering of 20
# numbers (from a standard normal distribution) and 20 NAs. Type x now to see what
# it looks like.
x

# The way you tell R that you want to select some particular elements (i.e. a
# 'subset') from a vector is by placing an 'index vector' in square brackets
# immediately following the name of the vector.

# For a simple example, try x[1:10] to view the first ten elements of x.
x[1:10]

# Index vectors come in four different flavors -- logical vectors, vectors of
# positive integers, vectors of negative integers, and vectors of character strings
# -- each of which we'll cover in this lesson.

# Let's start by indexing with logical vectors. One common scenario when working
# with real-world data is that we want to extract all elements of a vector that are
# not NA (i.e. missing data). Recall that is.na(x) yields a vector of logical values
# the same length as x, with TRUEs corresponding to NA values in x and FALSEs
# corresponding to non-NA values in x.

# What do you think x[is.na(x)] will give you?
# A vector of all NAs
x[is.na(x)]

# Recall that `!` gives us the negation of a logical expression, so !is.na(x) can be
# read as 'is not NA'. Therefore, if we want to create a vector called y that
# contains all of the non-NA values from x, we can use y <- x[!is.na(x)].
y <- x[!is.na(x)]
y

# Now that we've isolated the non-missing values of x and put them in y, we can
# subset y as we please.

# Recall that the expression y > 0 will give us a vector of logical values the same
# length as y, with TRUEs corresponding to values of y that are greater than zero
# and FALSEs corresponding to values of y that are less than or equal to zero. What
# do you think y[y > 0] will give you?
# > A vector of all the positive elements of y
y[y>0]

# You might wonder why we didn't just start with x[x > 0] to isolate the positive
# elements of x. Try that now to see why.
x[x > 0]

# Since NA is not a value, but rather a placeholder for an unknown quantity, the
# expression NA > 0 evaluates to NA. Hence we get a bunch of NAs mixed in with our
# positive numbers when we do this.

# Combining our knowledge of logical operators with our new knowledge of subsetting,
# we could do this -- x[!is.na(x) & x > 0]. Try it out.
x[!is.na(x) & x > 0]

# In this case, we request only values of x that are both non-missing AND greater
# than zero.

# Many programming languages use what's called 'zero-based indexing', which means
# that the first element of a vector is considered element 0. R uses 'one-based
# indexing', which (you guessed it!) means the first element of a vector is
# considered element 1.

# Can you figure out how we'd subset the 3rd, 5th, and 7th elements of x? Hint 
# Use the c() function to specify the element numbers as a numeric vector.
x[c(3,5,7)]


x[0]
x[3000]
# R doesn't prevent us from asking for it. This should be
# a cautionary tale. You should always make sure that what you are asking for is
# within the bounds of the vector you're working with.

# What if we're interested in all elements of x EXCEPT the 2nd and 10th? It would be
# pretty tedious to construct a vector containing all numbers 1 through 40 EXCEPT 2
# and 10.
# Luckily, R accepts negative integer indexes. Whereas x[c(2, 10)] gives us ONLY the
# 2nd and 10th elements of x, x[c(-2, -10)] gives us all elements of x EXCEPT for
# the 2nd and 10 elements.  Try x[c(-2, -10)] now to see this.
x[c(-2, -10)]
# or 
x[-c(2, 10)]

# So far, we've covered three types of index vectors -- logical, positive integer,
# and negative integer. The only remaining type requires us to introduce the concept
# of 'named' elements.
# Create a numeric vector with three named elements using 
# vect <- c(foo = 11, bar = 2, norf = NA).
vect <- c(foo = 11, bar = 2, norf = NA)

# When we print vect to the console, you'll see that each element has a name. Try it
# out.
vect

# We can also get the names of vect by passing vect as an argument to the names()
# function. Give that a try.
names(vect)

# Alternatively, we can create an unnamed vector vect2 with c(11, 2, NA).
vect2 <- c(11, 2, NA)

# Then, we can add the `names` attribute to vect2 after the fact with 
names(vect2) <- c("foo", "bar", "norf")

# Now, let's check that vect and vect2 are the same by passing them as arguments to
# the identical() function.
identical(vect,vect2)

# Now, back to the matter of subsetting a vector by named elements. Which of the
# following commands do you think would give us the second element of vect?
vect["bar"]

# Likewise, we can specify a vector of names with
vect[c("foo", "bar")]