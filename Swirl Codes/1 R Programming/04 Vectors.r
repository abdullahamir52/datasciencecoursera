# -----------------------------------------------------
# Chapter NUMBER 4: R Programming Vectors

# Vectors come in two different flavors: atomic vectors and lists. An atomic vector
# contains exactly one data type, whereas a list may contain multiple data types.
# We'll explore atomic vectors further before we get to lists.

# In previous lessons, we dealt entirely with numeric vectors, which are one type of
# atomic vector. Other types of atomic vectors include logical, character, integer,
# and complex. In this lesson, we'll take a closer look at logical and character
# vectors.

# Logical vectors can contain the values TRUE, FALSE, and NA (for 'not available').
# These values are generated as the result of logical 'conditions'. Let's experiment
# with some simple conditions.

# First, create a numeric vector num_vect that contains the values 0.5, 55, -10, 6.
num_vect<- c(0.5, 55, -10, 6)

# Now, create a variable called tf that gets the result of num_vect < 1, which is
# read as 'num_vect is less than 1'.
tf<- num_vect < 1

# Print the contents of tf now.
tf

# Let's try another. Type num_vect >= 6 without assigning the result to a new
# variable.
num_vect >= 6 

# If we have two logical expressions, A and B, we can ask whether at least one is
# TRUE with A | B (logical 'or' a.k.a. 'union') or whether they are both TRUE with A
# & B (logical 'and' a.k.a. 'intersection'). Lastly, !A is the negation of A and is
# TRUE when A is FALSE and vice versa.

# Create a character vector that contains the following words: "My", "name", "is".
# Remember to enclose each word in its own set of double quotes, so that R knows
# they are character strings. Store the vector in a variable called my_char.
my_char <- c("My", "name", "is")

# Print the contents of my_char to see what it looks like.
my_char

# Right now, my_char is a character vector of length 3. Let's say we want to join
# the elements of my_char together into one continuous character string (i.e. a
# character vector of length 1). We can do this using the paste() function.

# Type paste(my_char, collapse = " ") now. Make sure there's a space between the
# double quotes in the `collapse` argument. You'll see why in a second.
paste(my_char, collapse = " ")

# The `collapse` argument to the paste() function tells R that when we join together
# the elements of the my_char character vector, we'd like to separate them with
# single spaces.

# To add (or 'concatenate') your name to the end of my_char, use the c() function
# like this: c(my_char, "your_name_here"). Place your name in double quotes where
# I've put "your_name_here". Try it now, storing the result in a new variable called
# my_name.
my_name <- c(my_char, "Abdullah")

# Take a look at the contents of my_name.
my_name

# Now, use the paste() function once more to join the words in my_name together into
# a single character string. Don't forget to say collapse = " "!
paste(my_name, collapse = " ")

# In this example, we used the paste() function to collapse the elements of a single
# character vector. paste() can also be used to join the elements of multiple
# character vectors.

# In the simplest case, we can join two character vectors that are each of length 1
# (i.e. join two words). Try paste("Hello", "world!", sep = " "), where the `sep`
# argument tells R that we want to separate the joined elements with a single space.
paste("Hello", "world!", sep = " ")

# For a slightly more complicated example, we can join two vectors, 
# each of length 3. Use paste() to join the integer vector 1:3 
# with the character vector c("X", "Y", "Z"). This time, use sep = "" to 
# leave no space between the joined elements.
paste(1:3, c("X", "Y", "Z"), sep = "")

# What do you think will happen if our vectors are of different length? 
# (Hint: we talked about this in a previous lesson.)

# Vector recycling! Try paste(LETTERS, 1:4, sep = "-"), where LETTERS is a
# predefined variable in R containing a character vector of all 26 letters in the
# English alphabet.
paste(LETTERS, 1:4, sep = "-")

# Since the character vector LETTERS is longer than the numeric vector 1:4, R simply
# recycles, or repeats, 1:4 until it matches the length of LETTERS.

# Also worth noting is that the numeric vector 1:4 gets 'coerced' into a character
# vector by the paste() function.