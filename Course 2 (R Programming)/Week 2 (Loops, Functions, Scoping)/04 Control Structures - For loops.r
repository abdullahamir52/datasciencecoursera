# For loop
# ----------------
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