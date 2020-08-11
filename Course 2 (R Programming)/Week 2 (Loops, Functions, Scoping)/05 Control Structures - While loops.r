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