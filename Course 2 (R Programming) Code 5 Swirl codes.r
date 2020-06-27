# -----------------------------------------------------
# Chapter NUMBER 8: R Programming Logic 


# There are two logical values in R, also called boolean values. They are TRUE and FALSE. In R you can construct
# logical expressions which will evaluate to either TRUE or FALSE.

# Many of the questions in this lesson will involve evaluating logical expressions. It may be useful to open up a
# second R terminal where you can experiment with some of these expressions.

# Creating logical expressions requires logical operators. You're probably familiar with arithmetic operators like `+`,
# `-`, `*`, and `/`. The first logical operator we are going to discuss is the equality operator, represented by two
# equals signs `==`. Use the equality operator below to find out if TRUE is equal to TRUE.
TRUE == TRUE

# Just like arithmetic, logical expressions can be grouped by parenthesis so that the entire expression (TRUE == TRUE)
# == TRUE evaluates to TRUE.
# To test out this property, try evaluating (FALSE == TRUE) == FALSE .
(FALSE == TRUE) == FALSE

# The equality operator can also be used to compare numbers. Use `==` to see if 6 is equal to 7.
6==7

# The previous expression evaluates to FALSE because 6 is less than 7. Thankfully, there are inequality operators that
# allow us to test if a value is less than or greater than another value.

# The less than operator `<` tests whether the number on the left side of the operator (called the left operand) is
# less than the number on the right side of the operator (called the right operand). Write an expression to test
# whether 6 is less than 7.
6<7

# There is also a less-than-or-equal-to operator `<=` which tests whether the left operand is less than or equal to the
# right operand. Write an expression to test whether 10 is less than or equal to 10.
10<=10

# The next operator we will discuss is the 'not equals' operator represented by `!=`. Not equals tests whether two
# values are unequal, so TRUE != FALSE evaluates to TRUE. Like the equality operator, `!=` can also be used with
# numbers. Try writing an expression to see if 5 is not equal to 7.
!(5==7)

# Let's take a moment to review. The equals operator `==` tests whether two boolean values or numbers are equal, the
# not equals operator `!=` tests whether two boolean values or numbers are unequal, and the NOT operator `!` negates
# logical expressions so that TRUE expressions become FALSE and FALSE expressions become TRUE.

# At some point you may need to examine relationships between multiple logical expressions. This is where the AND
# operator and the OR operator come in.

# Let's look at how the AND operator works. There are two AND operators in R, `&` and `&&`. Both operators work
# similarly, if the right and left operands of AND are both TRUE the entire expression is TRUE, otherwise it is FALSE.
# For example, TRUE & TRUE evaluates to TRUE. Try typing FALSE & FALSE to how it is evaluated.
FALSE & FALSE

# You can use the `&` operator to evaluate AND across a vector. The `&&` version of AND only evaluates the first member
# of a vector. Let's test both for practice. Type the expression TRUE & c(TRUE, FALSE, FALSE).
TRUE & c(TRUE, FALSE, FALSE)
# [1]  TRUE FALSE FALSE

# What happens in this case is that the left operand `TRUE` is recycled across every element in the vector of the right
# operand. This is the equivalent statement as c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE).
# Now we'll type the same expression except we'll use the `&&` operator. Type the expression TRUE && c(TRUE, FALSE, FALSE).
TRUE && c(TRUE, FALSE, FALSE)
# [1] TRUE
# In this case, the left operand is only evaluated with the first member of the right operand (the vector). The rest of
# the elements in the vector aren't evaluated at all in this expression.

# The OR operator follows a similar set of rules. The `|` version of OR evaluates OR across an entire vector, while the
# `||` version of OR only evaluates the first member of a vector.
# An expression using the OR operator will evaluate to TRUE if the left operand or the right operand is TRUE. If both
# are TRUE, the expression will evaluate to TRUE, however if neither are TRUE, then the expression will be FALSE.
TRUE | c(TRUE, FALSE, FALSE)
# [1] TRUE TRUE TRUE

# Now let's try out the non-vectorized version of the OR operator. Type the expression TRUE || c(TRUE, FALSE, FALSE).
TRUE || c(TRUE, FALSE, FALSE)
# [1] TRUE

# Logical operators can be chained together just like arithmetic operators. The expressions: `6 != 10 && FALSE && 1 >=
# 2` or `TRUE || 5 < 9.3 || FALSE` are perfectly normal to see.

# As you may recall, arithmetic has an order of operations and so do logical expressions. All AND operators are
# evaluated before OR operators. Let's look at an example of an ambiguous case. Type: 
5 > 8 || 6 != 8 && 4 > 3.9
# [1] TRUE
# Let's walk through the order of operations in the above case. First the left and right operands of the AND operator
# are evaluated. 6 is not equal 8, 4 is greater than 3.9, therefore both operands are TRUE so the resulting expression
# `TRUE && TRUE` evaluates to TRUE. Then the left operand of the OR operator is evaluated: 5 is not greater than 8 so
# the entire expression is reduced to FALSE || TRUE. Since the right operand of this expression is TRUE the entire
# expression evaluates to TRUE.

# Which one of the following expressions evaluates to TRUE?
# 1: FALSE || TRUE && FALSE
# 2: 99.99 > 100 || 45 < 7.3 || 4 != 4.0
# 3: TRUE && 62 < 62 && 44 >= 44
# 4: TRUE && FALSE || 9 >= 4 && 3 < 6
# Selection: 2

# Which one of the following expressions evaluates to FALSE?
# 1: !(8 > 4) ||  5 == 5.0 && 7.8 >= 7.79
# 2: FALSE && 6 >= 6 || 7 >= 8 || 50 <= 49.5
# 3: 6 >= -9 && !(6 > 7) && !(!TRUE)
# 4: FALSE || TRUE && 6 != 4 || 9 > 4
# Selection: 2

# Now that you're familiar with R's logical operators you can take advantage of a few functions that R provides for
# dealing with logical expressions.

# The function isTRUE() takes one argument. If that argument evaluates to TRUE, the function will return TRUE.
# Otherwise, the function will return FALSE. Try using this function by typing:
isTRUE(6 > 4)
# [1] TRUE

# Which of the following evaluates to TRUE?
# 1: !isTRUE(4 < 3)
# 2: isTRUE(!TRUE)
# 3: !isTRUE(8 != 5)
# 4: isTRUE(NA)
# 5: isTRUE(3)
# Selection: 1

# The function identical() will return TRUE if the two R objects passed to it as arguments are identical. Try out the
# identical() function by typing: 
identical('twins', 'twins')
# [1] TRUE

# Which of the following evaluates to TRUE?
# 1: !identical(7, 7)
# 2: identical(4, 3.1)
# 3: identical('hello', 'Hello')
# 4: identical(5 > 4, 3 < 3.1)
# Selection: 4

# You should also be aware of the xor() function, which takes two arguments. The xor() function stands for exclusive
# OR. If one argument evaluates to TRUE and one argument evaluates to FALSE, then this function will return TRUE,
# otherwise it will return FALSE. Try out the xor() function by typing: xor(5 == 6, !FALSE)

# You should also be aware of the xor() function, which takes two arguments. The xor() function stands for exclusive
# OR. If one argument evaluates to TRUE and one argument evaluates to FALSE, then this function will return TRUE,
# otherwise it will return FALSE. Try out the xor() function by typing: xor(5 == 6, !FALSE)
xor(5 == 6, !FALSE)
# [1] TRUE

# 5 == 6 evaluates to FALSE, !FALSE evaluates to TRUE, so xor(FALSE, TRUE) evaluates to TRUE. On the other hand if the
# first argument was changed to 5 == 5 and the second argument was unchanged then both arguments would have been TRUE,
# so xor(TRUE, TRUE) would have evaluated to FALSE.

# Which of the following evaluates to FALSE?
# 1: xor(!isTRUE(TRUE), 6 > -1)
# 2: xor(!!TRUE, !!FALSE)
# 3: xor(identical(xor, 'xor'), 7 == 7.0)
# 4: xor(4 >= 9, 8 != 8.0)
# Selection: 4

# For the next few questions, we're going to need to create a vector of integers called ints. Create this vector by typing:
ints <- sample(10)
ints

# The vector `ints` is a random sampling of integers from 1 to 10 without replacement. Let's say we wanted to ask some
# logical questions about contents of ints. If we type ints > 5, we will get a logical vector corresponding to whether
# each element of ints is greater than 5. Try typing: 
ints > 5

# We can use the resulting logical vector to ask other questions about ints. The which() function takes a logical
# vector as an argument and returns the indices of the vector that are TRUE. For example which(c(TRUE, FALSE, TRUE))
# would return the vector c(1, 3).

# Use the which() function to find the indices of ints that are greater than 7.
which(ints>7)

# Like the which() function, the functions any() and all() take logical vectors as their argument. The any() function
# will return TRUE if one or more of the elements in the logical vector is TRUE. The all() function will return TRUE if
# every element in the logical vector is TRUE.

# Use the any() function to see if any of the elements of ints are less than zero.
any(ints<0)
# [1] FALSE

# Use the all() function to see if all of the elements of ints are greater than zero.
all(ints>0)
# [1] TRUE


# Which of the following evaluates to TRUE?
# 1: any(ints == 2.5)
# 2: any(ints == 10)
# 3: all(ints == 10)
# 4: all(c(TRUE, FALSE, TRUE))
# Selection: 2







# -----------------------------------------------------
# Chapter NUMBER 9: R Programming Functions

# Functions are one of the fundamental building blocks of the R language. They are small pieces of reusable code that
# can be treated like any other R object.

# If you've worked through any other part of this course, you've probably used some functions already. Functions are
# usually characterized by the name of the function followed by parentheses.

# Let's try using a few basic functions just for fun. The Sys.Date() function returns a string representing today's
# date. Type Sys.Date() below and see what happens.
Sys.Date()
# [1] "2020-06-26"

# Most functions in R return a value. Functions like Sys.Date() return a value based on your computer's environment,
# while other functions manipulate input data in order to compute a return value.

# The mean() function takes a vector of numbers as input, and returns the average of all of the numbers in the input
# vector. Inputs to functions are often called arguments. Providing arguments to a function is also sometimes called
# passing arguments to that function. Arguments you want to pass to a function go inside the function's parentheses.
# Try passing the argument c(2, 4, 5) to the mean() function.
mean(c(2,4,5))

# Functions usually take arguments which are variables that the function operates on. For example, the mean() function
# takes a vector as an argument, like in the case of mean(c(2,6,8)). The mean() function then adds up all of the
# numbers in the vector and divides that sum by the length of the vector.

# The last R expression to be evaluated in a function will become the return value of that function. We want this
# function to take one argument, x, and return x without modifying it. Delete the pound sign so that x is returned
# without any modification. Make sure to save your script before you type submit().
submit()

# You're about to write your first function! Just like you would assign a value 
# to a variable with the assignment operator, you assign functions in the following
# way:
#
# function_name <- function(arg1, arg2){
#	# Manipulate arguments in some way
#	# Return a value
# }
#
# The "variable name" you assign will become the name of your function. arg1 and
# arg2 represent the arguments of your function. You can manipulate the arguments
# you specify within the function. After sourcing the function, you can use the 
# function by typing:
# 
# function_name(value1, value2)
#
# Below we will create a function called boring_function. This function takes
# the argument `x` as input, and returns the value of x without modifying it.
# Delete the pound sign in front of the x to make the function work! Be sure to 
# save this script and type submit() in the console after you make your changes.
boring_function <- function(x) {
  x
}

# Now that you've created your first function let's test it! Type: boring_function('My first function!'). If your
# function works, it should just return the string: 'My first function!'
boring_function('My first function!')
# [1] "My first function!"

# If you want to see the source code for any function, just type the function name without any arguments or
# parentheses. Let's try this out with the function you just created. Type: boring_function to view its source code.
#
# Time to make a more useful function! We're going to replicate the functionality of the mean() function by creating a
# function called: my_mean(). Remember that to calculate the average of all of the numbers in a vector you find the sum
# of all the numbers in the vector, and then divide that sum by the number of numbers in the vector.
#
# You're free to implement the function my_mean however you want, as long as it
# returns the average of all of the numbers in `my_vector`.
#
# Hint #1: sum() returns the sum of a vector.
# 	Ex: sum(c(1, 2, 3)) evaluates to 6
#
# Hint #2: length() returns the size of a vector.
# 	Ex: length(c(1, 2, 3)) evaluates to 3
#
# Hint #3: The mean of all the numbers in a vector is equal to the sum of all of
#		   the numbers in the vector divided by the size of the vector.
#
# Note for those of you feeling super clever: Please do not use the mean()
# function while writing this function. We're trying to teach you something 
# here!
#
# Be sure to save this script and type submit() in the console after you make 
# your changes.
#
# Use the sum() function to find the sum of all the numbers in the vector. Use the length() function to find the size
# of the vector.
my_mean <- function(my_vector, na.rm = TRUE) {
  m <- sum(my_vector, na.rm = TRUE)/length(my_vector)
  m
  # Write your code here!
  # Remember: the last expression evaluated will be returned! 
}

# Now test out your my_mean() function by finding the mean of the vector c(4, 5, 10).
my_mean(c(4,5,10))
# [1] 6.333333


# Next, let's try writing a function with default arguments. You can set default values for a
# function's arguments, and this can be useful if you think someone who uses your function
# will set a certain argument to the same value most of the time.
# Let me show you an example of a function I'm going to make up called
# increment(). Most of the time I want to use this function to increase the
# value of a number by one. This function will take two arguments: "number" and
# "by" where "number" is the digit I want to increment and "by" is the amount I
# want to increment "number" by. I've written the function below. 
#
# increment <- function(number, by = 1){
#     number + by
# }
#
# If you take a look in between the parentheses you can see that I've set
# "by" equal to 1. This means that the "by" argument will have the default
# value of 1.
#
# I can now use the increment function without providing a value for "by": 
# increment(5) will evaluate to 6. 
#
# However if I want to provide a value for the "by" argument I still can! The
# expression: increment(5, 2) will evaluate to 7. 
# 
# You're going to write a function called "remainder." remainder() will take
# two arguments: "num" and "divisor" where "num" is divided by "divisor" and
# the remainder is returned. Imagine that you usually want to know the remainder
# when you divide by 2, so set the default value of "divisor" to 2. Please be
# sure that "num" is the first argument and "divisor" is the second argument.
#
# Hint #1: You can use the modulus operator %% to find the remainder.
#   Ex: 7 %% 4 evaluates to 3. 
#
# Remember to set appropriate default values! Be sure to save this 
# script and type submit() in the console after you write the function.
remainder <- function(num, divisor =2 ) {
  rem <- num%%divisor
  rem
  # Remember: the last expression evaluated will be returned! 
}
# Let's do some testing of the remainder function. Run remainder(5) and see what happens.
remainder(5)
# [1] 1

# Let's take a moment to examine what just happened. You provided one argument to the function, and R matched that argument
# to 'num' since 'num' is the first argument. The default value for 'divisor' is 2, so the function used the default value
# you provided.

# Now let's test the remainder function by providing two arguments. Type: remainder(11, 5) and let's see what happens.
remainder(11, 5)
# [1] 1

# You can also explicitly specify arguments in a function. When you explicitly designate argument values by name, the
# ordering of the arguments becomes unimportant. You can try this out by typing: remainder(divisor = 11, num = 5).
remainder(divisor = 11, num = 5)
# [1] 5
# As you can see, there is a significant difference between remainder(11, 5) and remainder(divisor = 11, num = 5)!

# R can also partially match arguments. Try typing remainder(4, div = 2) to see this feature in action.
remainder(4, div = 2)
# [1] 0

# A word of warning: in general you want to make your code as easy to understand as possible. Switching around the orders
# of arguments by specifying their names or only using partial argument names can be confusing, so use these features with
# caution!

# With all of this talk about arguments, you may be wondering if there is a way you can see a function's arguments (besides
# looking at the documentation). Thankfully, you can use the args() function! Type: args(remainder) to examine the
# arguments for the remainder function.
args(remainder) 
# function (num, divisor = 2) 
# NULL

# You may not realize it but I just tricked you into doing something pretty interesting! args() is a function, remainder()
# is a function, yet remainder was an argument for args(). Yes it's true: you can pass functions as arguments! This is a
# very powerful concept. Let's write a script to see how it works.

# You can pass functions as arguments to other functions just like you can pass
# data to functions. Let's say you define the following functions:
#
# add_two_numbers <- function(num1, num2){
#    num1 + num2
# }
#
# multiply_two_numbers <- function(num1, num2){
#	num1 * num2
# }
#
# some_function <- function(func){
#    func(2, 4)
# }
#
# As you can see we use the argument name "func" like a function inside of 
# "some_function()." By passing functions as arguments 
# some_function(add_two_numbers) will evaluate to 6, while
# some_function(multiply_two_numbers) will evaluate to 8.
# 
# Finish the function definition below so that if a function is passed into the
# "func" argument and some data (like a vector) is passed into the dat argument
# the evaluate() function will return the result of dat being passed as an
# argument to func.
#
# Hints: This exercise is a little tricky so I'll provide a few example of how
# evaluate() should act:
#    1. evaluate(sum, c(2, 4, 6)) should evaluate to 12
#    2. evaluate(median, c(7, 40, 9)) should evaluate to 9
#    3. evaluate(floor, 11.1) should evaluate to 11
evaluate <- function(func, dat){
  func(dat)
  # Remember: the last expression evaluated will be returned! 
}

# Let's take your new evaluate() function for a spin! Use evaluate to find the standard deviation of the vector 
evaluate(sd,c(1.4, 3.6, 7.9, 8.8))
# [1] 3.514138

# You may be surprised to learn that you can pass a function as an argument without first defining the passed function.
# Functions that are not named are appropriately known as anonymous functions.

# Let's use the evaluate function to explore how anonymous functions work. For the first argument of the evaluate function
# we're going to write a tiny function that fits on one line. In the second argument we'll pass some data to the tiny
# anonymous function in the first argument.
# Type the following command and then we'll discuss how it works: evaluate(function(x){x+1}, 6)
evaluate(function(x){x+1}, 6)
# [1] 7
# The first argument is a tiny anonymous function that takes one argument `x` and returns `x+1`. We passed the number 6
# into this function so the entire expression evaluates to 7.

# Try using evaluate() along with an anonymous function to return the first element of the vector c(8, 4, 0). Your
# anonymous function should only take one argument which should be a variable `x`.
# You may need to recall how to index vector elements. Remember that your anonymous function should only have one argument,
# and that argument should be named `x`.
evaluate(function(x){x[1]}, c(8,4,0))

# Now try using evaluate() along with an anonymous function to return the last element of the vector c(8, 4, 0). Your
# anonymous function should only take one argument which should be a variable `x`.
# You may need to recall how to index vector elements. Remember that your anonymous function should only have one argument,
# and that argument should be named `x`. Using the length() function in your anonymous function may help you.
evaluate(function(x){x[length(x)]}, c(8,4,0))
# [1] 0

# For the rest of the course we're going to use the paste() function frequently. Type ?paste so we can take a look at the
# documentation for the paste function.
?paste
# paste (..., sep = " ", collapse = NULL, recycle0 = FALSE)
# As you can see the first argument of paste() is `...` which is referred to as an ellipsis or simply dot-dot-dot. The
# ellipsis allows an indefinite number of arguments to be passed into a function. In the case of paste() any number of
# strings can be passed as arguments and paste() will return all of the strings combined into one string.

# Just to see how paste() works, type 
paste("Programming", "is", "fun!")
# [1] "Programming is fun!"

# Time to write our own modified version of paste().

# The ellipses can be used to pass on arguments to other functions that are
# used within the function you're writing. Usually a function that has the
# ellipses as an argument has the ellipses as the last argument. The usage of
# such a function would look like:
#
# ellipses_func(arg1, arg2 = TRUE, ...)
#
# In the above example arg1 has no default value, so a value must be provided
# for arg1. arg2 has a default value, and other arguments can come after arg2
# depending on how they're defined in the ellipses_func() documentation.
# Interestingly the usage for the paste function is as follows:
#
# paste (..., sep = " ", collapse = NULL)
#
# Notice that the ellipses is the first argument, and all other arguments after
# the ellipses have default values. This is a strict rule in R programming: all
# arguments after an ellipses must have default values. Take a look at the
# simon_says function below:
#
# simon_says <- function(...){
#   paste("Simon says:", ...)
# }
#
# The simon_says function works just like the paste function, except the
# begining of every string is prepended by the string "Simon says:"
#
# Telegrams used to be peppered with the words START and STOP in order to
# demarcate the beginning and end of sentences. Write a function below called 
# telegram that formats sentences for telegrams.
# For example the expression `telegram("Good", "morning")` should evaluate to:
# "START Good morning STOP"
telegram <- function(...){
  paste("START", ... , "STOP")
}

#Now let's test out your telegram function. Use your new telegram function passing in whatever arguments you wish!
telegram("My name is Abdullah")
# [1] "START My name is Abdullah STOP"


# Let's explore how to "unpack" arguments from an ellipses when you use the
# ellipses as an argument in a function. Below I have an example function that
# is supposed to add two explicitly named arguments called alpha and beta.
# 
# add_alpha_and_beta <- function(...){
#   # First we must capture the ellipsis inside of a list
#   # and then assign the list to a variable. Let's name this
#   # variable `args`.
#
#   args <- list(...)
#
#   # We're now going to assume that there are two named arguments within args
#   # with the names `alpha` and `beta.` We can extract named arguments from
#   # the args list by using the name of the argument and double brackets. The
#   # `args` variable is just a regular list after all!
#   
#   alpha <- args[["alpha"]]
#   beta  <- args[["beta"]]
#
#   # Then we return the sum of alpha and beta.
#
#   alpha + beta 
# }
#
# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.
#
# Your function should have three sections: capture the ellipsis in a list(), unpack the arguments from the ellipsis
# and assign them to variables, then pass those variables to paste().
mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

# Time to use your mad_libs function. Make sure to name the place, adjective, and noun arguments in order for your
# function to work.
mad_libs("Dhaka", "agitated", "statue")
# [1] "News from  today where  students took to the streets in protest of the new  being installed on campus."

# You're familiar with adding, subtracting, multiplying, and dividing numbers in R. To do this you use the +, -, *,
# and / symbols. These symbols are called binary operators because they take two inputs, an input from the left and
# an input from the right.
# In R you can define your own binary operators. In the next script I'll show you how.


# The syntax for creating new binary operators in R is unlike anything else in
# R, but it allows you to define a new syntax for your function. I would only
# recommend making your own binary operator if you plan on using it often!
#
# User-defined binary operators have the following syntax:
#      %[whatever]% 
# where [whatever] represents any valid variable name.
# 
# Let's say I wanted to define a binary operator that multiplied two numbers and
# then added one to the product. An implementation of that operator is below:
#
# "%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
#   left * right + 1
# }
#
# I could then use this binary operator like `4 %mult_add_one% 5` which would
# evaluate to 21.
#
# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

"%p%" <- function(left,right){ # Remember to add arguments!
  paste(left,right)
}

# You made your own binary operator! Let's test it out. Paste together the strings: 'I', 'love', 'R!' using your new
# binary operator.
"I"%p%"love"%p%"R!"
# [1] "I love R!"







# -----------------------------------------------------
# Chapter NUMBER 14: R Programming Dates and Times 

# R has a special way of representing dates and times, which can be helpful if you're working with data that show how
# something changes over time (i.e. time-series data) or if your data contain some other temporal information, like
# dates of birth.

# Dates are represented by the 'Date' class and times are represented by the 'POSIXct' and 'POSIXlt' classes.
# Internally, dates are stored as the number of days since 1970-01-01 and times are stored as either the number of
# seconds since 1970-01-01 (for 'POSIXct') or a list of seconds, minutes, hours, etc. (for 'POSIXlt').

# Let's start by using d1 <- Sys.Date() to get the current date and store it in the variable d1. (That's the letter 'd'
# and the number 1.)
d1 <- Sys.Date()

# Use the class() function to confirm d1 is a Date object.
class(d1)
# [1] "Date"

# We can use the unclass() function to see what d1 looks like internally. Try it out.
unclass(d1) 
# [1] 18440
# That's the exact number of days since 1970-01-01!

# However, if you print d1 to the console, you'll get today's date -- YEAR-MONTH-DAY. Give it a try.
d1
# [1] "2020-06-27"

# What if we need to reference a date prior to 1970-01-01? Create a variable d2 containing as.Date("1969-01-01").
d2 <- as.Date("1969-01-01")

# Now use unclass() again to see what d2 looks like internally.
unclass(d2)
#[1] -365

# As you may have anticipated, you get a negative number. In this case, it's -365, since 1969-01-01 is exactly one calendar
# year (i.e. 365 days) BEFORE 1970-01-01.

# Now, let's take a look at how R stores times. You can access the current date and time using the Sys.time() function with no
# arguments. Do this and store the result in a variable called t1.
t1 <- Sys.time()
t1
# [1] "2020-06-28 02:31:35 +06"
class(t1)
# [1] "POSIXct" "POSIXt" 

# As mentioned earlier, POSIXct is just one of two ways that R represents time information. (You can ignore the second value
# above, POSIXt, which just functions as a common language between POSIXct and POSIXlt.) Use unclass() to see what t1 looks
# like internally -- the (large) number of seconds since the beginning of 1970.
unclass(t1)
# [1] 1593289895

# By default, Sys.time() returns an object of class POSIXct, but we can coerce the result to POSIXlt with
# as.POSIXlt(Sys.time()). Give it a try and store the result in t2.
t2 <- as.POSIXlt(Sys.time())
class(t2)
# [1] "POSIXlt" "POSIXt" 
t2
# [1] "2020-06-28 02:34:19 +06"


# The printed format of t2 is identical to that of t1. Now unclass() t2 to see how it is different internally.
unclass(t2)
# $sec
# [1] 19.19029
#
# $min
# [1] 34
#
# $hour
# [1] 2
#
# $mday
# [1] 28
#
# $mon
# [1] 5
#
# $year
# [1] 120
#
# $wday
# [1] 0
# 
# $yday
# [1] 179
#
# $isdst
# [1] 0
#
# $zone
# [1] "+06"
# 
# $gmtoff
# [1] 21600
#
# attr(,"tzone")
# [1] ""    "+06" "+07"


# t2, like all POSIXlt objects, is just a list of values that make up the date and time. Use str(unclass(t2)) to have a
# more compact view.
str(unclass(t2))
# List of 11
# $ sec   : num 19.2
# $ min   : int 34
# $ hour  : int 2
# $ mday  : int 28
# $ mon   : int 5
# $ year  : int 120
# $ wday  : int 0
# $ yday  : int 179
# $ isdst : int 0
# $ zone  : chr "+06"
# $ gmtoff: int 21600
# - attr(*, "tzone")= chr [1:3] "" "+06" "+07"


# If, for example, we want just the minutes from the time stored in t2, we can access them with t2$min.
t2$min
# [1] 34

# Now that we have explored all three types of date and time objects, let's look at a few functions that extract useful
# information from any of these objects -- weekdays(), months(), and quarters().

# The weekdays() function will return the day of week from any date or time object. Try it out on d1, which is the Date
# object that contains today's date.
weekdays(d1)
# [1] "Saturday"

# The months() function also works on any date or time object. Try it on t1, which is the POSIXct object that contains
# the current time (well, it was the current time when you created it).
months(t1)
# [1] "June"

# The quarters() function returns the quarter of the year (Q1-Q4) from any date or time object. Try it on t2, which is
# the POSIXlt object that contains the time at which you created it.
quarters(t2)
# [1] "Q2"

# Often, the dates and times in a dataset will be in a format that R does not recognize. The strptime() function can be
# helpful in this situation.
# strptime() converts character vectors to POSIXlt. In that sense, it is similar to as.POSIXlt(), except that the input
# doesn't have to be in a particular format (YYYY-MM-DD).
# To see how it works, store the following character string in a variable called t3: "October 17, 1986 08:24" (with the
# quotes).
t3 <- "October 17, 1986 08:24"

# Now, use strptime(t3, "%B %d, %Y %H:%M") to help R convert our date/time object to a format that it understands.
# Assign the result to a new variable called t4. (You should pull up the documentation for strptime() if you'd like to
# know more about how it works.)
t4 <- strptime(t3, "%B %d, %Y %H:%M")
t4
# [1] "1986-10-17 08:24:00 +06"

# That's the format we've come to expect. Now, let's check its class().
class(t4)
# [1] "POSIXlt" "POSIXt" 

# Finally, there are a number of operations that you can perform on dates and times, including arithmetic operations (+
# and -) and comparisons (<, ==, etc.)

# The variable t1 contains the time at which you created it (recall you used Sys.time()). Confirm that some time has
# passed since you created t1 by using the 'greater than' operator to compare it to the current time: Sys.time() > t1
Sys.time() > t1
# [1] TRUE

# So we know that some time has passed, but how much? Try subtracting t1 from the current time using Sys.time() - t1.
# Don't forget the parentheses at the end of Sys.time(), since it is a function.
Sys.time() - t1
# Time difference of 10.64425 mins

# The same line of thinking applies to addition and the other comparison operators. If you want more control over the
# units when finding the above difference in times, you can use difftime(), which allows you to specify a 'units'
# parameter.

# Use difftime(Sys.time(), t1, units = 'days') to find the amount of time in DAYS that has passed since you created t1.
difftime(Sys.time(), t1, units = 'days')
# Time difference of 0.007766778 days

# In this lesson, you learned how to work with dates and times in R. While it is important to understand the basics, if
# you find yourself working with dates and times often, you may want to check out the lubridate package by Hadley
# Wickham.
