# R data types: Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
#   foo   bar
# 1   1  TRUE
# 2   2  TRUE
# 3   3 FALSE
# 4   4 FALSE

nrow(x)
# 4
ncol(x)
# 2