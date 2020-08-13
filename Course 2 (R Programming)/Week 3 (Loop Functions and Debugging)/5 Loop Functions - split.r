# split
# ----------------------

# split takes a vector or other objects and splits it into groups determined 
# by a factor or list of factors.

str(split)
# function (x, f, drop = FALSE, ...)  

# x is a vector (or list) or data frame
# f is a factor (or coerced to one) or a list of factors
# drop indicates whether empty factors levels should be dropped

 
# split
# ----------

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
# Output
# $`1`
# [1] -0.39756945  0.09172404 -0.23869407 -0.46196236  1.92634061
# [6]  0.12205481  1.09205058 -2.97225748  1.12848905  1.31200013
# 
# $`2`
# [1] 0.31468707 0.01283631 0.41104448 0.77408093 0.95231884
# [6] 0.72636577 0.51643916 0.73395483 0.85040566 0.81838622
# 
# $`3`
# [1]  1.5876429  0.8417004  0.7079146 -0.4198990 -1.1383180
# [6]  0.9774999  1.2697710  0.4970306  1.6308074  1.4745652


# split
# ----------

# A common idiom is split followed by an lapply.

lapply(split(x, f), mean)
# Output
# $`1`
# [1] 0.1602176
# 
# $`2`
# [1] 0.6110519
# 
# $`3`
# [1] 0.7428715

 

# Splitting a Data Frame
# -------------------------

library(datasets)
head(airquality)
# Output
#     Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6


s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# Output
# $`5`
#     Ozone     Solar.R        Wind 
#       NA        NA         11.62258 
# 
# $`6`
#     Ozone     Solar.R        Wind 
#       NA     190.16667     10.26667 
# 
# $`7`
#     Ozone     Solar.R        Wind 
#       NA     216.483871     8.941935 
# 
# $`8`
#     Ozone     Solar.R        Wind 
#       NA        NA          8.793548 
# 
# $`9`
#     Ozone     Solar.R        Wind 
#       NA     167.4333      10.1800 



sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# Output
#                5         6          7        8        9
# Ozone         NA        NA         NA       NA       NA
# Solar.R       NA 190.16667 216.483871       NA 167.4333
# Wind    11.62258  10.26667   8.941935 8.793548  10.1800

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
# Output
#                 5         6          7          8         9
# Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
# Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
# Wind     11.62258  10.26667   8.941935   8.793548  10.18000



# Splitting on More than One Level
# --------------------------------

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)

f1
# Output
# [1] 1 1 1 1 1 2 2 2 2 2
# Levels: 1 2

f2
# Output
# [1] 1 1 2 2 3 3 4 4 5 5
# Levels: 1 2 3 4 5

interaction(f1, f2)
# Output
# [1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
# Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5



# Interactions can create empty levels
# --------------------------------

str(split(x, list(f1, f2)))
# Output
# List of 10
# $ 1.1: num [1:2] -0.529 1.344
# $ 2.1: num(0) 
# $ 1.2: num [1:2] 0.469 -0.253
# $ 2.2: num(0) 
# $ 1.3: num 0.369
# $ 2.3: num -1.35
# $ 1.4: num(0) 
# $ 2.4: num [1:2] 1.17 -1.91
# $ 1.5: num(0) 
# $ 2.5: num [1:2] -1.004 0.677


# Empty levels can be dropped.
# --------------------------------

str(split(x, list(f1, f2), drop = TRUE))
# Output
# List of 6
# $ 1.1: num [1:2] -0.529 1.344
# $ 1.2: num [1:2] 0.469 -0.253
# $ 1.3: num 0.369
# $ 2.3: num -1.35
# $ 2.4: num [1:2] 1.17 -1.91
# $ 2.5: num [1:2] -1.004 0.677