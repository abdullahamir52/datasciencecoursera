# The R Profiler
# ------------------

# The Rprof() function starts the profiler in R
#   - R must be compiled with profiler support 
#     (but this is usually the case)

# The summaryRprof() function summarizes the output from Rprof() 
# (otherwise it’s not readable).

# DO NOT use system.time() and Rprof() together or you will be sad

# Rprof() keeps track of the function call stack at regularly sampled 
# intervals and tabulates how much time is spend in each function.

# Default sampling interval is 0.02 seconds.

# NOTE: If your code runs very quickly, the profiler is not useful, 
# but then you probably don't need it in that case.



# R Profiler Raw Output
# ---------------------
# ## lm(y ~ x)
# sample.interval=10000
# "list" "eval" "eval" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "list" "eval" "eval" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "list" "eval" "eval" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "list" "eval" "eval" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "na.omit" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "na.omit" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "na.omit" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "na.omit" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "na.omit" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "na.omit" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "na.omit" "model.frame.default" "model.frame" "eval" "eval" "lm"
# "lm.fit" "lm"
# "lm.fit" "lm"
# "lm.fit" "lm"



# Using summaryRprof()
# ----------------------

# The summaryRprof() function tabulates the R profiler output and 
# calculates how much time is spend in which function.

# There are two methods for normalizing the data.

# "by.total" divides the time spend in each function by the total run time.

# "by.self" does the same but first subtracts out time spent in functions 
# above in the call stack.

# By Total
# $by.total
#                             total.time    total.pct   self.time   self.pct
# "lm"                            7.41        100.00       0.30        4.05
# "lm.fit"                        3.50         47.23       2.99       40.35
# "model.frame.default"           2.24         30.23       0.12        1.62
# "eval"                          2.24         30.23       0.00        0.00
# "model.frame"                   2.24         30.23       0.00        0.00
# "na.omit"                       1.54         20.78       0.24        3.24
# "na.omit.data.frame"            1.30         17.54       0.49        6.61
# "lapply"                        1.04         14.04       0.00        0.00
# "[.data.frame"                  1.03         13.90       0.79       10.66
# "["                             1.03         13.90       0.00        0.00
# "as.list.data.frame"            0.82         11.07       0.82       11.07
# "as.list"                       0.82         11.07       0.00        0.00


# By Self
# $by.self
#                             self.time   self.pct   total.time    total.pct
# "lm.fit"                       2.99       40.35        3.50         47.23
# "as.list.data.frame"           0.82       11.07        0.82         11.07
# "[.data.frame"                 0.79       10.66        1.03         13.90
# "structure"                    0.73        9.85        0.73          9.85
# "na.omit.data.frame"           0.49        6.61        1.30         17.54
# "list"                         0.46        6.21        0.46          6.21
# "lm"                           0.30        4.05        7.41        100.00
# "model.matrix.default"         0.27        3.64        0.79         10.66
# "na.omit"                      0.24        3.24        1.54         20.78
# "as.character"                 0.18        2.43        0.18          2.43
# "model.frame.default"          0.12        1.62        2.24         30.23
# "anyDuplicated.default"        0.02        0.27        0.02          0.27



# summaryRprof() Output
# -----------------------
# $sample.interval
# [1] 0.02
# $sampling.time
# [1] 7.41



# Summary
# ---------

# Rprof() runs the profiler for performance of analysis of R code.

# summaryRprof() summarizes the output of Rprof() and gives percent of 
# time spent in each function (with two types of normalization).

# Good to break your code into functions so that the profiler can give 
# useful information about where time is being spent.

# C or Fortran code is not profiled.