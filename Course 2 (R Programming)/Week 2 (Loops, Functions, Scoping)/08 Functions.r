# Writing my own function
# How to use the function syntax, specify the arguments, and 
# how to return a value


# We will write a function that adds two values
add2 <- function(x,y)
{
  x + y
  # didn't have to use any return value here
  # in any r function, by default, returns whatever the last expression was
}

add2(3,5)
# [1] 8


# Vector of numbers, return the subset of the vector's values above 10
x <- 1:20
above10 <- function(x) {
  use <- x > 10 
  # created a logical vector that returns a T/F after checking an element in x
  x[use]
  # the last line is the return value, subsets the values in x > 10.
}

# give the function a value to give a result
above10(x)
#  [1] 11 12 13 14 15 16 17 18 19 20


# creating a function that subsets values above any number that you can specify
x <- 1:20
above <- function(x,n) {
  use <- x > n 
  x[use]
}

# give it a value to give a result; otherwise gives an error (n not specified)
above(x,12)
# [1] 13 14 15 16 17 18 19 20


# using a specified default value of n 
x <- 1:20
above <- function(x,n = 10) {
  use <- x > n 
  x[use]
}

# give it a value to give a result; otherwise gives an error (n not specified)
above(x)
# [1] 11 12 13 14 15 16 17 18 19 20



# Creating a function that calculates the mean of each column of a matrix/df
columnmean <- function(y) 
  { # y is going to be the df/matrix in question
    nc = ncol(y) # calculates the number of column in the df/matrix
  
    # intialize a vector that stores the mean for each column
    # length of the vector has to equal the number of columns
    means <- numeric(nc)
    
    for(i in 1:nc)
      { means[i]<- mean(y[,i])
        # I haven't set a return value yet; this fn is not useful, yet. 
      }
  means
  # this is the last expression in the function = return value 
  }

columnmean(airquality)
# [1]        NA        NA  9.957516 77.882353  6.993464 15.803922

# gives us six values. 2 of them are NA, bcz some columns have missing values
# so add an argument to change the NA values 


columnmean <- function(y, removeNA = TRUE) 
  {
    nc = ncol(y) 
  
    means <- numeric(nc)
    
    for(i in 1:nc)
      {
        means[i]<- mean(y[,i], na.rm = removeNA)
      }
    means
  }

columnmean(airquality)
# [1]  42.129310 185.931507   9.957516  77.882353   6.993464  15.803922



# Functions can be passed as arguments to other functions
# Functions can be nested
# return value = last expression in the function body to be evaluated.
# The formal arguments are the arguments included in the function definition
# The formals function returns a list of all the formal arguments of a function
# Not every function call in R makes use of all the formal arguments
# Function arguments can be missing or might have default values


# R functions arguments can be matched position-wise or by name
# So the following calls to sd are all equivalent
mydata <- rnorm(100) # generate 100 random numbers
sd(mydata) # specifying argument
sd(x = mydata) # specifying argument by naming it 
sd(x = mydata, na.rm = FALSE) # whether to exclude the missing values or not
sd(na.rm = FALSE, x = mydata) # Order does not matter if you name the args
sd(na.rm = FALSE, mydata) 

# Output of all of the 'sd' commands (depends on what data was generated)
# [1] 0.9510843

# if you name an arg, then the arg w/o name gets assigned in a 
# chronological order 


# Argument matching
# You can mix positional matching with matching by name. When an argument is 
# matched by name, it is “taken out” of the argument list and the remaining 
# unnamed arguments are matched in the order that they are listed in the 
# function definition

args(lm) # this shows the arguments of lm() function
# Output
# function (formula, data, subset, weights, na.action, method = "qr", 
#           model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
#           contrasts = NULL, offset, ...) 
#   NULL

# The following two calls are equivalent.
lm(data = mydata, y - x, model = FALSE, 1:100)
lm(y - x, mydata, 1:100, model = FALSE)


# Most of the time, named arguments are useful on the command line when you 
# have a long argument list and you want to use the defaults for everything 
# except for an argument near the end of the list.
# Named arguments also help if you can remember the name of the argument and 
# not its position on the argument list (plotting is a good example).

# Function arguments can also be partially matched, which is useful for 
# interactive work. The order of operations when given an argument is
# 1. Check for exact match for a named argument
# 2. Check for a partial match
# 3. Check for a positional match

# Defining a Function
# In addition to not specifying a default value, you can also set an 
# argument value to NULL.
f <- function(a, b = 1, c = 2, d = NULL) 
  {
  }

# Lazy Evaluation
# Arguments to functions are evaluated lazily, so they are evaluated only as 
# needed. This function never actually uses the argument b, so calling f(2) 
# will not produce an error because the 2 gets position-wise matched to a.
f <- function(a, b) 
  {
    a^2
  }

f(2)
# [1] 4

# Again
f <- function(a, b) {
  print(a)
  print(b)
}

f(45)
# Output
## [1] 45
## Error: argument "b" is missing, with no default

# Notice that “45” got printed first before the error was triggered. 
# This is because b did not have to be evaluated until after print(a). 
# Once the function tried to evaluate print(b) it had to throw an error.



# The “...” Argument
# The ... argument indicate a variable number of arguments that are usually 
# passed on to other functions.
#... is often used when extending another function and you don’t want to copy 
# the entire argument list of the original function
myplot <- function(x, y, type = "l", ...) 
  {
    plot(x, y, type = type, ...)
  }
# Generic functions use ... so that extra arguments can be passed to methods 
mean
function (x, ...)
UseMethod("mean")

# The ... argument is also necessary when the number of arguments 
# passed to the function cannot be known in advance.
args(paste)
# function (..., sep = " ", collapse = NULL, recycle0 = FALSE) 
#   NULL

args(cat)
# function (..., file = "", sep = " ", fill = FALSE, 
#           labels = NULL, append = FALSE) 
#   NULL


# Arguments Coming After the “...” Argument
# One catch with ... is that any arguments that appear after ... on the 
# argument list must be named explicitly and cannot be partially matched.
args(paste)
# function (..., sep = " ", collapse = NULL, recycle0 = FALSE) 
#   NULL

paste("a", "b", sep = ":")
# [1] "a:b"

paste("a", "b", se = ":")
# [1] "a b :"