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

# Any operation involving NA generally yields NA as the result. To illustrate, let's
# create a vector c(44, NA, 5, NA) and assign it to a variable x.
x <- c(44, NA, 5, NA) 

# Now, let's multiply x by 3.
x*3

# To make things a little more interesting, lets create a vector containing 1000
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

# In our previous discussion of logical operators, we introduced the `==` operator
# as a method of testing for equality between two objects. So, you might think the
# expression my_data == NA yields the same results as is.na(). Give it a try.
my_data == NA 

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

# Pretty cool, huh? Finally, let's take a look at the data to convince ourselves
# that everything 'adds up'. Print my_data to the console.
my_data

# Now that we've got NAs down pat, let's look at a second type of missing value --
# NaN, which stands for 'not a number'. To generate NaN, try dividing (using a
# forward slash) 0 by 0 now.
0/0

# Let's do one more, just for fun. In R, Inf stands for infinity. What happens if
# you subtract Inf from Inf?
Inf - Inf 






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






# -----------------------------------------------------
# Chapter NUMBER 7: R Programming Matrices and Data Frames

# The main difference, as you'll see, is that matrices can only contain a single
# class of data, while data frames can consist of many different classes of data.

# Let's create a vector containing the numbers 1 through 20 using the `:` operator.
# Store the result in a variable called my_vector.
my_vector <- 1:20

# View the contents of the vector you just created.
my_vector

# The dim() function tells us the 'dimensions' of an object. What happens if we do
# dim(my_vector)? Give it a try.
dim(my_vector)

# Clearly, that's not very helpful! Since my_vector is a vector, it doesn't have a
# `dim` attribute (so it's just NULL), but we can find its length using the length()
# function. Try that now.
length(my_vector)

# Ah! That's what we wanted. But, what happens if we give my_vector a `dim`
# attribute? Let's give it a try. Type dim(my_vector) <- c(4, 5).
dim(my_vector) <- c(4,5)
# we just gave my_vector 4 rows and 5 columns.


# It's okay if that last command seemed a little strange to you. It should! The
# dim() function allows you to get OR set the `dim` attribute for an R object. In
# this case, we assigned the value c(4, 5) to the `dim` attribute of my_vector.

# Use dim(my_vector) to confirm that we've set the `dim` attribute correctly.
dim(my_vector)
# alternatively
attributes(my_vector)

# But, wait! That doesn't sound like a vector any more. Well, it's not. Now it's a
# matrix. View the contents of my_vector now to see what it looks like.
my_vector

# Now, let's confirm it's actually a matrix by using the class() function.
class(my_vector)

# Sure enough, my_vector is now a matrix. We should store it in a new variable that
# helps us remember what it is. Store the value of my_vector in a new variable
# called my_matrix.
my_matrix <- my_vector

# The example that we've used so far was meant to illustrate the point that a matrix
# is simply an atomic vector with a dimension attribute. A more direct method of
# creating the same matrix uses the matrix() function.
?matrix

# Now, look at the documentation for the matrix function and see if you can figure
# out how to create a matrix containing the same numbers (1-20) and dimensions (4
# rows, 5 columns) by calling the matrix() function. Store the result in a variable
# called my_matrix2.
my_matrix2 <- matrix(1:20, nrow = 4, ncol = 5)

# Finally, let's confirm that my_matrix and my_matrix2 are actually identical. The
# identical() function will tell us if its first two arguments are the same.
identical(my_matrix,my_matrix2)

# Now, imagine that the numbers in our table represent some measurements from a
# clinical experiment, where each row represents one patient and each column
# represents one variable for which measurements were taken.

# We may want to label the rows, so that we know which numbers belong to each
# patient in the experiment. One way to do this is to add a column to the matrix,
# which contains the names of all four people.

# Let's start by creating a character vector containing the names of our patients
# Bill, Gina, Kelly, and Sean. Remember that double quotes tell R that something is
# a character string. Store the result in a variable called patients.
patients <- c("Bill", "Gina", "Kelly", "Sean")

# Now we'll use the cbind() function to 'combine columns'. Don't worry about storing
# the result in a new variable. Just call cbind() with two arguments -- the patients
# vector and my_matrix.
cbind(patients,my_matrix)

# Something is fishy about our result! It appears that combining the character
# vector with our matrix of numbers caused everything to be enclosed in double
# quotes. This means we're left with a matrix of character strings, which is no
# good.

# If you remember back to the beginning of this lesson, I told you that matrices can
# only contain ONE class of data. Therefore, when we tried to combine a character
# vector with a numeric matrix, R was forced to 'coerce' the numbers to characters,
# hence the double quotes.

# This is called 'implicit coercion', because we didn't ask for it. It just
# happened. But why didn't R just convert the names of our patients to numbers? I'll
# let you ponder that question on your own.

# So, we're still left with the question of how to include the names of our patients
# in the table without destroying the integrity of our numeric data. Try the
# following -- my_data <- data.frame(patients, my_matrix)
my_data <- data.frame(patients, my_matrix)

# Now view the contents of my_data to see what we've come up with.
my_data

# It looks like the data.frame() function allowed us to store our character vector
# of names right alongside our matrix of numbers. That's exactly what we were hoping
# for!

# Behind the scenes, the data.frame() function takes any number of arguments and
# returns a single object of class `data.frame` that is composed of the original
# objects.

# Let's confirm this by calling the class() function on our newly created data frame.
class(my_data)

# It's also possible to assign names to the individual rows and columns of a data
# frame, which presents another possible way of determining which row of values in
# our table belongs to each patient.

# However, since we've already solved that problem, let's solve a different problem
# by assigning names to the columns of our data frame so that we know what type of
# measurement each column represents.

# Since we have six columns (including patient names), we'll need to first create a
# vector containing one element for each column. Create a character vector called
# cnames that contains the following values (in order) -- "patient", "age",
# "weight", "bp", "rating", "test".
cnames <- c("patient", "age", "weight", "bp", "rating", "test")

# Now, use the colnames() function to set the `colnames` attribute for our data
# frame. This is similar to the way we used the dim() function earlier in this
# lesson.
colnames(my_data) <- cnames

# Let's see if that got the job done. Print the contents of my_data.
my_data






