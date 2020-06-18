# --------------------------------
# How swirl works

# Press esc key to exit swirl and return to the r prompt
# If you are already at the prompt, type bye() to exit and save your progress. 


# When you are at the R prompt (>):
# Typing skip() allows you to skip the current question.
# Typing play() lets you experiment with R on your own; 
# swirl will ignore whatyou do...
# UNTIL you type nxt() which will regain swirl's attention.
# Typing bye() causes swirl to exit. Your progress will be saved.
# yping main() returns you to swirl's main menu.
# Typing info() displays these options again.





# How swirl works
# ----------------------------------------
# Chapter NUMBER 1: Basic Building Blocks

# Making a vector, using the concatenate function, c()
z<- c(1.1, 9, 3.14)

# Asking question about a function
?c

# Concatenate vectors with new values
c(z,555,z)

# Arithmatic expressions
z * 2 + 100
# multiplies everything in z with 2 and then adds 100 with each element
# To take the square root, use the sqrt() function and to take the
# absolute value, use the abs() function.
# z * 2 + 100 = z * c(2, 2, 2) + c(100, 100, 100).
# R recycles the shorter vector until it is the same length of the longer one

# type the first two letters of a variable and hit the tabkey,
# it will show you the variables associated with those letters





# -----------------------------------------------------
# Chapter NUMBER 2: R Programming Workspace and Files

# Determine the current working directory
getwd()

# List all the objects in your local workspace using ls().
ls()

# List all the files in your working directory using list.files() or dir().
list.files()
dir()

# Using the args() function on a function name is also a handy way to see what
# arguments a function can take.
args(list.files) 

# Type old.dir <- getwd() to assign the value of the current working directory to
# a variable called "old.dir".
old.dir<- getwd()

# Type dir.create("testdir") to create a directory in the current working
# directory called "testdir".
dir.create("testdir")

# Set your working directory to "testdir" with the setwd() command.
setwd("testdir")

# Create a file in your working directory called "mytest.R" using the
# file.create() function.
file.create("mytest.R")

# This should be the only file in this newly created directory. Let's check this
# by listing all the files in the current directory.
dir()
list.files() 

# Check to see if "mytest.R" exists in the working directory using the
# file.exists() function.
file.exists("mytest.R")

# Access information about the file "mytest.R" by using file.info().
file.info("mytest.R")

# You can use the $ operator --- e.g., file.info("mytest.R")$mode --- to grab
# specific items.

# Change the name of the file "mytest.R" to "mytest2.R" by using file.rename().
file.rename("mytest.R", "mytest2.R")

# to remove/delete a file
file.remove('mytest.R')

# Make a copy of "mytest2.R" called "mytest3.R" using file.copy().
file.copy("mytest2.R", "mytest3.R")

# Provide the relative path to the file "mytest3.R" by using file.path().
file.path("mytest3.R")

# You can use file.path to construct file and directory paths that are independent
# of the operating system your R code is running on. Pass 'folder1' and 'folder2'
# as arguments to file.path to make a platform-independent pathname.
file.path("folder1", "folder2")

# Take a look at the documentation for dir.create by entering ?dir.create . Notice
# the 'recursive' argument. In order to create nested directories, 'recursive' must
# be set to TRUE.
?dir.create

# Create a directory in the current working directory called "testdir2" and a
# subdirectory for it called "testdir3", all in one command by using dir.create()
# and file.path().
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)

# Go back to your original working directory using setwd(). 
# (Recall that we created the variable old.dir with the full path for the 
# orginal working directory at the start of these questions.)
setwd(old.dir)

# After you finish this lesson delete the 'testdir' directory that you just left
# (and everything in it)
unlink("testdir", recursive = TRUE)
# If recursive = FALSE directories are not deleted, not even empty ones.
# file.remove() can only remove files, but gives more detailed error info




# -----------------------------------------------------
# Chapter NUMBER 3: R Programming Sequences of Numbers

# The simplest way to create a sequence of numbers in R is by using the `:`
# operator. Type 1:20 to see how it works.
1:20

# That gave us every integer between (and including) 1 and 20. We could also use it
# to create a sequence of real numbers. For example, try pi:10.
pi:10

# another example
15:1
# It counted backwards in increments of 1! It's unlikely we'd want this behavior,
# but nonetheless it's good to know how it could happen.

# an operator like the colon used above, you must enclose the symbol in 
# backticks like this: ?`:`. (NOTE: The backtick (`) key is generally located
# in the top left corner of a keyboard, above the Tab key.
# Pull up the documentation for `:` now.
?`:`

# sec() function gives us more control over the sequences we are creating
seq(1,20)

# This gives us the same output as 1:20. However, let's say that instead we want a
# vector of numbers ranging from 0 to 10, incremented by 0.5. seq(0, 10, by=0.5)
# does just that. Try it out.
seq(0,10, by = 0.5)

# Or maybe we don't care what the increment is and we just want a sequence of 30
# numbers between 5 and 10. seq(5, 10, length=30) does the trick. Give it a shot now
# and store the result in a new variable called my_seq.
my_seq<- seq(5,10, length = 30)

# To confirm that my_seq has length 30, we can use the length() function.
length(my_seq)

# Let's pretend we don't know the length of my_seq, but we want to generate a
# sequence of integers from 1 to N, where N represents the length of the my_seq
# vector. In other words, we want a new vector (1, 2, 3, ...) that is the same
# length as my_seq.
# There are several ways we could do this. One possibility is to combine the `:`
# operator and the length() function like this: 1:length(my_seq). Give that a try.
1:length(my_seq)
# Another option is to use seq(along.with = my_seq). Give that a try.
seq(along.with = my_seq)
# Another option is to use seq(along.with = my_seq). Give that a try.
seq(along.with = my_seq)
# However, as is the case with many common tasks, R has a separate built-in function
# for this purpose called seq_along(). Type seq_along(my_seq) to see it in action.
seq_along(my_seq)

# creating a vector that contains 40 zeros, we can use rep(0, times = 40).
rep(0, times = 40)

# If instead we want our vector to contain 10 repetitions of the vector (0, 1, 2),
# we can do rep(c(0, 1, 2), times = 10). Go ahead.
rep(c(0, 1, 2), times = 10)

# Finally, let's say that rather than repeating the vector (0, 1, 2) over and over
# again, we want our vector to contain 10 zeros, then 10 ones, then 10 twos. We can
# do this with the `each` argument. Try rep(c(0, 1, 2), each = 10).
rep(c(0, 1, 2), each = 10)


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

# -----------------------------------------------------
# Chapter NUMBER 5: R Programming Missing Values 

