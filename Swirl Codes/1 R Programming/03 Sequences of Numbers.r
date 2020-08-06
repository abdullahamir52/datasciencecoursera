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
# [1] 30

# Let's pretend we don't know the length of my_seq, but we want to generate a
# sequence of integers from 1 to N, where N represents the length of the my_seq
# vector. In other words, we want a new vector (1, 2, 3, ...) that is the same
# length as my_seq.
# There are several ways we could do this. One possibility is to combine the `:`
# operator and the length() function like this: 1:length(my_seq). Give that a try.
1:length(my_seq)
# 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 
# 26 27 28 29 30

# Another option is to use seq(along.with = my_seq). Give that a try.
seq(along.with = my_seq)

# However, as is the case with many common tasks, R has a separate built-in function
# for this purpose called seq_along(). Type seq_along(my_seq) to see it in action.
seq_along(my_seq)

# creating a vector that contains 40 zeros, we can use rep(0, times = 40).
rep(0, times = 40)
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

# If instead we want our vector to contain 10 repetitions of the vector (0, 1, 2),
# we can do rep(c(0, 1, 2), times = 10). Go ahead.
rep(c(0, 1, 2), times = 10)
# [1] 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2

# Finally, let's say that rather than repeating the vector (0, 1, 2) over and over
# again, we want our vector to contain 10 zeros, then 10 ones, then 10 twos. We can
# do this with the `each` argument. Try rep(c(0, 1, 2), each = 10).
rep(c(0, 1, 2), each = 10)
#  [1] 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2