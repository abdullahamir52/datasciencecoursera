# Subsetting Lists
x <- list(foo = 1:4, bar = 0.6)
x[1]          # prints out the first element, foo
# $foo
# [1] 1 2 3 4


# If x is a list, x[1] is going to be a list too
x[[1]]        # prints out only the vector(foo), not the list
# [1] 1 2 3 4


x$bar         # Similar to the x[[1]], gives a vector
# [1] 0.6

x[["bar"]]    # Similar to the x[[1]], gives a vector
# [1] 0.6

x["bar"]      # Similar to the x[1], gives a list
# $bar
# [1] 0.6


# Extracting multiple elements from a list
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]
# $foo
# [1] 1 2 3 4
# 
# $baz
# [1] "hello"


# The [[ operator can be used with computed indices; 
# $ can only be used with literal names.
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]] ## computed index for ‘foo’
# [1] 1 2 3 4

x$name ## element ‘name’ doesn’t exist!
# NULL

x$foo
# [1] 1 2 3 4 

# The [[ can take an integer sequence.
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
# $a
# $a[[1]]
# [1] 10
# 
# $a[[2]]
# [1] 12
# 
# $a[[3]]
# [1] 14
# 
# 
# $b
# [1] 3.14 2.81

x[[c(1, 3)]]
# [1] 14

x[[1]][[3]]
# [1] 14

x[[c(2, 1)]]
# [1] 3.14