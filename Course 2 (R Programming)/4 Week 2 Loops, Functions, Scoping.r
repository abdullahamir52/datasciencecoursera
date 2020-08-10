# Week 2 Control Structures
# -------------------------


# If else statement
# -------------
if(x > 3) {
  y <- 10
} else {
  y <- 0
}
# Alternatvely
y <- if(x > 3) {
  10
} else {
  0
}



# For loop
# -------------
# for loops take an interator variable and assign it successive values from a 
# sequence or vector. For loops are most commonly used for iterating over the 
# elements of an object (list, vector, etc.). i is the loop index in for loop

for(i in 1:10) 
  {
  print(i)
  }


# These four loops have the same behavior.
x <- c("a", "b", "c", "d")
# Loop 1
for(i in 1:4) 
  {
  print(x[i])
  }
# Loop 2
for(i in seq_along(x)) 
  {
  print(x[i])
  }
# Loop 3
for(letter in x) 
  {
  print(letter)
  }
# Loop 4
for(i in 1:4) print(x[i])

# Output
# [1] "a"
# [1] "b"
# [1] "c"
# [1] "d"


# Nested for loops
x <- matrix(1:6, 2, 3)
x
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
for(i in seq_len(nrow(x))) 
  {
    for(j in seq_len(ncol(x))) 
      {
        print(x[i, j])
      }
  }
# Output
# [1] 1
# [1] 3
# [1] 5
# [1] 2
# [1] 4
# [1] 6

for(i in seq_len(ncol(x))) 
{
  for(j in seq_len(nrow(x))) 
  {
    print(x[j, i])
  }
}
# Output
# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 5
# [1] 6

# read the documentation of seq to see what's inside it
?seq_along



# While loop
count <- 0
while(count < 10) 
  {
    print(count)
    count <- count + 1
  }
# Output
# [1] 0
# [1] 1
# ......
# [1] 9

# Sometimes there will be more than one condition in the test.
# Conditions are always evaluated from left to right.
z <- 5
while(z >= 3 && z <= 10) 
  {
    print(z)
    coin <- rbinom(1, 1, 0.5)
    if(coin == 1) 
      { ## random walk
        z <- z + 1
      } 
    else 
      {
        z <- z - 1
      }
  }
# Output
# [1] 5
# [1] 4
# [1] 3

# Or
# Output
# [1] 5
# [1] 6
# [1] 7
# [1] 8
# [1] 7
# [1] 6
# [1] 7
# [1] 6
# [1] 5
# [1] 4
# [1] 3

# REPEAT, BREAK
# Repeat initiates an infinite loop; these are not commonly used in statistical 
# applications but they do have their uses. The only way to exit a repeat loop
# is to call break.
# The loop with the repeat is a bit dangerous because there’s no guarantee 
# it will stop. Better to set a hard limit on the number of iterations 
# (e.g. using a for loop) and then report whether convergence was 
# achieved or not.



# next, return
# next is used to skip an iteration of a loop
# return signals that a function should exit and return a given value
for(i in 1:40) 
  {
  if(i <= 20) 
    {
    ## Skip the first 20 iterations
    next
    }
  print(i)
  }

# Output
# [1] 21
# [1] 22
# ......
# [1] 39
# [1] 40

# Control structures mentiond here are primarily useful for writing programs; 
# for command-line interactive work, the *apply functions are more useful.




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
columnmean <- function(y) { # y is going to be the df/matrix in question
    nc = ncol(y) # calculates the number of column in the df/matrix
    
    # intialize a vector that stores the mean for each column
    # length of the vector has to equal the number of columns
    means <- numeric(nc)
    for(i in 1:nc){
      means[i]<- mean(y[,i])
      # I haven't set a return value yet; this fn is not useful, yet. 
    }
    means
    # this is the last expression in the function = return value 
}

columnmean(airquality)
# [1]        NA        NA  9.957516 77.882353  6.993464 15.803922

# gives us six values. 2 of them are NA, bcz some columns have missing values
# so add an argument to change the NA values 


columnmean <- function(y, removeNA = TRUE) {
  nc = ncol(y) 
  
  means <- numeric(nc)
  for(i in 1:nc){
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


# R functions arguments can be matched positionally or by name
# So the following calls to sd are all equivalent
mydata <- rnorm(100) # generate 100 random numbers
sd(mydata) # specifying argument
sd(x = mydata) # specifying argument by naming it 
sd(x = mydata, na.rm = FALSE) # whether to exclude the missing values or not
sd(na.rm = FALSE, x = mydata) # Order does not matter if you name the args
sd(na.rm = FALSE, mydata) 

# Output of all of the 'sd' commands
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
f <- function(a, b = 1, c = 2, d = NULL) {
}

# Lazy Evaluation
# Arguments to functions are evaluated lazily, so they are evaluated only as 
# needed. This function never actually uses the argument b, so calling f(2) 
# will not produce an error because the 2 gets positionally matched to a.
f <- function(a, b) {
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
myplot <- function(x, y, type = "l", ...) {
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

paste("a", "b", sep = ":")
# [1] "a:b"
paste("a", "b", se = ":")
# [1] "a b :"


# How does R know which value to assign to which symbol? When I type: 
lm <- function(x) { x * x }
lm
# function(x) { x * x }

# how does R know what value to assign to the symbol lm? 
# Why doesn’t it give it the value of lm that is in the stats package?

# When R tries to bind a value to a symbol, it searches through a series of 
# environments to find the appropriate value. When you are working on the 
# command line and need to retrieve the value of an R object, 
# the order is roughly
# 1. Search the global environment for a symbol name matching the one requested.
# 2. Search the namespaces of each of the packages on the search list
# The search list can be found by using the search function.
search()

# The global environment or the user’s workspace is always the first element of 
# the search list and the base package is always the last.
# The order of the packages on the search list matters! User’s can configure 
# which packages get loaded on startup so you cannot assume that there will be
# a set list of packages available. When a user loads a package with library 
# the namespace of that package gets put in position 2 of the search list 
# (by default) and everything else gets shifted down the list. Note that R 
# has separate namespaces for functions and non-functions so it’s possible 
# to have an object named c and a function named c.


# Lexical Scoping
# Consider the following function.
f <- function(x, y) {
  x^2 + y / z
}
# This function has 2 formal arguments x and y. In the body of the function 
# there is another symbol z. In this case z is called a free variable. The 
# scoping rules of a language determine how values are assigned to free 
# variables. Free variables are not formal arguments and are not local 
# variables (assigned insided the function body).

# Lexical scoping in R means that the values of free variables are searched 
# for in the environment in which the function was defined. What is an 
# environment? An environment is a collection of (symbol, value) pairs


# Lexical Scoping
# Why does all this matter?
# Typically, a function is defined in the global environment, so that the 
# values of free variables are just found in the user’s workspace. This 
# behavior is logical for most people and is usually the “right thing” to do. 
# However, in R you can have functions defined inside other functions languages 
# like C don’t let you do this. Now things get interesting — In this case the 
# environment in which a function is defined is the
# body of another function!

# Example
#--------
make.power <- function(n) {
  pow <- function(x) {
    x^n # here, inside the pow fn, n is a free variable
  }
  pow
}

# This function returns another function as its value.
cube <- make.power(3)
square <- make.power(2)

cube(3)
# [1] 27
square(3)
# [1] 9

# How to check what’s in a function’s environment?
ls(environment(cube))
# [1] "n"   "pow"
get("n", environment(cube))
# [1] 3
ls(environment(square))
# [1] "n"   "pow"
get("n", environment(square))
# [1] 2


# Lexical vs. Dynamic Scoping
y <- 10 # this is the global environment value of 'y' for R
f <- function(x) {
  y <- 2 # this is the calling environment/parent frame in R for value of 'y'
  y^2 + g(x) # within function f, both 'y' and 'g' are free variables
  
}

g <- function(x) {
  x*y # here, 'y' is a free variable
}

# What is the value of
f(3)
# 34



# With lexical scoping the value of y in the function g is looked up in the 
# environment in which the function was defined, in this case the global 
# environment, so the value of y is 10. With dynamic scoping, the value of y 
# is looked up in the environment from which the function was called 
# (sometimes referred to as the calling environment). In R the calling 
# environment is known as the parent frame So the value of y would be 2.

# When a function is defined in the global environment and is subsequently 
# called from the global environment, then the defining environment and the 
# calling environment are the same. This can sometimes give the appearance 
# of dynamic scoping.

g <- function(x) {
  a <- 3 # 'a' is local variable defined within the function
  x+a+y # 'y' is a free variables, 'x' is a formal argument
}

g(2)
# Error in g(2) : object "y" not found
y <- 3 # it will look like the 'y' was looked up within the calling environment
g(2)
# [1] 8

# actually 'y' is defined within the global environment


# Consequences of Lexical Scoping
# In R, all objects must be stored in memory
# All functions must carry a pointer to their respective defining environments, 
# which could be anywhere. 
# In S-PLUS, free variables are always looked up in the global workspace, 
# so everything can be stored on the disk because the “defining environment” 
# of all functions is the same.


# Application: Optimization
# Optimization routines in R like optim, nlm, and optimize require you to 
# pass a function whose argument is a vector of parameters 
# (e.g. a log-likelihood). However, an object function might depend on a host 
# of other things besides its parameters (like data). When writing software 
# which does optimization, it may be desirable to allow the user to hold
# certain parameters fixed

# Maximizing a Normal Likelihood
# Write a “constructor” function

make.NegLogLik <- function(data, fixed=c(FALSE,FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5*length(data)*log(2*pi*sigma^2)
    b <- -0.5*sum((data-mu)^2) / (sigma^2)
    -(a + b)
  }
}

# Note: Optimization functions in R minimize functions, so you need to use the negative log-likelihood.

set.seed(1); normals <- rnorm(100, 1, 2) # gives a normal dist, with mean = 1, sd = 2
nLL <- make.NegLogLik(normals)
nLL
# function(p) {
#   params[!fixed] <- p
#   mu <- params[1]
#   sigma <- params[2]
#   a <- -0.5*length(data)*log(2*pi*sigma^2)
#   b <- -0.5*sum((data-mu)^2) / (sigma^2)
#   -(a + b)
# }
# <bytecode: 0x000002442588bf48>
#   <environment: 0x000002442dae86a0>


ls(environment(nLL))
# [1] "data"   "fixed"  "params"



# Estimating Parameters
optim(c(mu = 0, sigma = 1), nLL)$par
#     mu    sigma 
# 1.218239 1.787343 

# Fixing σ = 2 (sd)
nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum
# 1.217775

# Fixing μ = 1 (mean)
nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum
# 1.800596


# Plotting the Likelihood
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

nLL <- make.NegLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")


# Lexical Scoping Summary
# Objective functions can be “built” which contain all of the necessary data 
# for evaluating the function. No need to carry around long argument 
# lists — useful for interactive and exploratory work. Code can be simplified 
# and cleand up,



# Dates and Times in R
# R has developed a special representation of dates and times
# Dates are represented by the Date class
# Times are represented by the POSIXct or the POSIXlt class
# Dates are stored internally as the number of days since 1970-01-01
# Tmes are stored internally as the number of seconds since 1970-01-01


# Dates in R
# Dates are represented by the Date class and can be coerced from a character 
# string using the as.Date() function.
x <- as.Date("1970-01-01")
x
## [1] "1970-01-01"
unclass(x)
## [1] 0
unclass(as.Date("1970-01-02"))
## [1] 1


# Times in R
# Times are represented using the POSIXct or the POSIXlt class. There are a 
# number of generic functions that work on dates and times. POSIXct is just a 
# very large integer under the hood; it use a useful class when you want 
# to store times in something like a data frame. POSIXlt is a list underneath 
# and it stores a bunch of other useful information like the day of the week, 
# day of the year, month, day of the month weekdays: give the day of the week. 
# months: give the month name. quarters: give the quarter number 
# (“Q1”, “Q2”, “Q3”, or “Q4”)

# Times in R
# Times can be coerced from a character string using the as.POSIXlt or 
# as.POSIXct function.
x <- Sys.time()
x
## [1] "2013-01-24 22:04:14 EST"
p <- as.POSIXlt(x)
names(unclass(p))
## [1] "sec" "min" "hour" "mday" "mon"
## [6] "year" "wday" "yday" "isdst"
p$sec
## [1] 14.34

# Times in R
# You can also use the POSIXct format.
x <- Sys.time()
x ## Already in ‘POSIXct’ format
## [1] "2013-01-24 22:04:14 EST"
unclass(x)
## [1] 1359083054
x$sec
## Error: $ operator is invalid for atomic vectors
p <- as.POSIXlt(x)
p$sec
## [1] 14.37


# Times in R
# Finally, there is the strptime function in case your dates are 
# written in a different format
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
## [1] "2012-01-10 10:40:00 EST" "2011-12-09 09:10:00 EST"
class(x)
## [1] "POSIXlt" "POSIXt"
# I can never remember the formatting strings. Check ?strptime for details.


# Operations on Dates and Times
# You can use mathematical operations on dates and times. Well, really 
# just + and -. You can do comparisons too (i.e. ==, <=)
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y # cannot be calculated
## Warning: Incompatible methods ("-.Date",
## "-.POSIXt") for "-"
## Error: non-numeric argument to binary operator
x <- as.POSIXlt(x)
x-y # can be calculated
## Time difference of 356.3 days


# Operations on Dates and Times
# Even keeps track of leap years, leap seconds, daylight savings, and time zones.
x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y # keeps track of leap year etc.
## Time difference of 2 days

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x # keeps track of the time zone difference
## Time difference of 11 hours