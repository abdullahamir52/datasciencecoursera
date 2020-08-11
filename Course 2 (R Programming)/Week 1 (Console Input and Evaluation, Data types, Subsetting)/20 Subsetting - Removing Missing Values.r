# Removing NA (missing) Values
x <- c(1, 2, NA, 4, NA, 5)
x
bad <- is.na(x)
# created a logical vector that tells me where the NA values are

bad
# [1] FALSE FALSE  TRUE FALSE  TRUE FALSE
# this gives us where the missing values are

x[!bad]
# [1] 1 2 4 5
# this gives us the values without the NA 

# What if there are multiple things and you want to take the subset 
# with no missing values?
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
# [1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE
x[good]
# [1] 1 2 4 5

y[good]
# [1] "a" "b" "d" "f"

# another example
airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]