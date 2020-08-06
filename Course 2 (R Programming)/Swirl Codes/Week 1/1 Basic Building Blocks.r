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
z <- c(1.1, 9, 3.14)

# Asking question about a function
?subset

# Concatenate vectors with new values
c(z,555,z)
# [1]   1.10   9.00   3.14 555.00   1.10   9.00   3.14

# Arithmatic expressions
z * 2 + 100
# [1] 102.20 118.00 106.28

# multiplies everything in z with 2 and then adds 100 with each element
# To take the square root, use the sqrt() function and to take the
# absolute value, use the abs() function.
# basically, z * 2 + 100 = z * c(2, 2, 2) + c(100, 100, 100).
# R recycles the shorter vector until it is the same length of the longer one

# type the first two letters of a variable and hit the tabkey,
# it will show you the variables associated with those letters