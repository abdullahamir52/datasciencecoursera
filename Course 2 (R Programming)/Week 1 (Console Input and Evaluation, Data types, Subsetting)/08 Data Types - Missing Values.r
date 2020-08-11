# Missing values
x <- c(1, 2, NA, 10, 3)
is.na(x)
# [1] FALSE FALSE  TRUE FALSE FALSE

is.nan(x)
# FALSE FALSE FALSE FALSE FALSE

x <- c(1, 2, NaN, NA, 4)
is.na(x)
# [1] FALSE FALSE  TRUE  TRUE FALSE

is.nan(x)
# [1] FALSE FALSE  TRUE FALSE FALSE

# A NaN value is also NA but the converse is not true