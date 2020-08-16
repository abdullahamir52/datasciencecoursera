# Why is My Code So Slow?
# --------------------------

# Profiling is a systematic way to examine how much time is spend in 
# different parts of a program

# Useful when trying to optimize your code

# Often code runs fine once, but what if you have to put it in a loop for 
# 1,000 iterations? Is it still fast enough?

# Profiling is better than guessing


# On Optimizing Your Code
# --------------------------

# Getting biggest impact on speeding up code depends on knowing where 
# the code spends most of its time.

# This cannot be done without performance analysis or profiling.

# We should forget about small efficiencies, say about 97% of the time: 
# premature optimization is the root of all evil
# --Donald Knuth



# General Principles of Optimization
# ----------------------------------

# Design first, then optimize

# Remember: Premature optimization is the root of all evil

# Measure (collect data), don’t guess.

# If you're going to be scientist, you need to apply the same principles here!


# Using system.time()
# ------------------------

# Takes an arbitrary R expression as input (can be wrapped in curly braces) 
# and returns the amount of time taken to evaluate the expression. 

# Computes the time (in seconds) needed to execute an expression
# - If there’s an error, gives time until the error occurred

# Returns an object of class proc_time
# - user time: time charged to the CPU(s) for this expression
# - elapsed time: "wall clock" time

# Usually, the user time and elapsed time are relatively close, for straight 
# computing tasks.

# Elapsed time may be greater than user time if the CPU spends a lot of time 
# waiting around.

# Elapsed time may be smaller than the user time if your machine has multiple 
# cores/processors (and is capable of using them).
# - Multi-threaded BLAS libraries (vecLib/Accelerate, ATLAS, ACML, MKL)
# - Parallel processing via the parallel package




## Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
# Output
# user  system elapsed 
# 0.12    0.05    3.65 

# 'user' is amount of time CPU takes for that
# 'elapsed' time what the programmar experiences

# Warning messages:
# 1: In doTryCatch(return(expr), name, parentenv, handler) :
#   display list redraw incomplete
# 2: In doTryCatch(return(expr), name, parentenv, handler) :
#   invalid graphics state
# 3: In doTryCatch(return(expr), name, parentenv, handler) :
#   invalid graphics state



## Elapsed time < user time

hilbert <- function(n) 
{
  i <- 1:n
  1 / outer(i - 1, i, '+' )
}

x <- hilbert(1000)

system.time(svd(x))
# Output
# user  system elapsed 
# 4.62    0.02    4.92 




# Timing Longer Expressions
# --------------------------

system.time({
  n <- 1000
  r <- numeric(n)
  for (i in 1:n) {
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})

# Output
# user  system elapsed 
# 0.14    0.00    0.14 



# Beyond system.time()
# -----------------------

# Using system.time() allows you to test certain functions or code blocks 
# to see if they are taking excessive amounts of time.

# Assumes you already know where the problem is and can call 
# system.time() on it.

# What if you don’t know where to start?