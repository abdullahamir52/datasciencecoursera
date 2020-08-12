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

# Control structures mentioned here are primarily useful for writing programs; 
# for command-line interactive work, the *apply functions are more useful.