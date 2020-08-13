# traceback
# -------------

mean(x)
# Error in mean(x) : object 'x' not found

traceback()
# 1: mean(x)



# Another page
lm(y ~ x)
# Error in eval(predvars, data, env) : object 'y' not found

traceback()
# Output
# 7: eval(predvars, data, env)
# 6: eval(predvars, data, env)
# 5: model.frame.default(formula = y ~ x, drop.unused.levels = TRUE)
# 4: stats::model.frame(formula = y ~ x, drop.unused.levels = TRUE)
# 3: eval(mf, parent.frame())
# 2: eval(mf, parent.frame())
# 1: lm(y ~ x)



# debug
# ----------

debug(lm)
lm(y ~ x)
# debugging in: lm(y ~ x)
# debug: {
#   ret.x <- x
#   ret.y <- y
#   cl <- match.call()
#   ...
#   if (!qr)
#     z$qr <- NULL
#   z
# }
# Browse[2]>
# Browse[2]> n
# debug: ret.x <- x
# Browse[2]> n
# debug: ret.y <- y
# Browse[2]> n
# debug: cl <- match.call()
# Browse[2]> n
# debug: mf <- match.call(expand.dots = FALSE)
# Browse[2]> n
# debug: m <- match(c("formula", "data", "subset", "weights", "na.action",
#                     "offset"), names(mf), 0L)



options(error = recover)
read.csv("nosuchfile")
# Error in file(file, "rt") : cannot open the connection
# In addition: Warning message:
# In file(file, "rt") :
#   cannot open file 'nosuchfile': No such file or directory
# 
# Enter a frame number, or 0 to exit   
# 
# 1: read.csv("nosuchfile")
# 2: read.table(file = file, header = header, sep = sep, quote = quote, 
#               dec = dec, fill = fill, comment.char =
# 3: file(file, "rt")
#               
# Selection: 




# Debugging
# ---------------------

# Summary

# There are three main indications of a problem: message, warning, error
#           only an error is fatal

# When analyzing a function with a problem, make sure you can reproduce the 
# problem, clearly state your expectations and how the output differs from 
# your expectation. 

# Interactive debugging tools traceback, debug, browser, trace, and recover 
# can be used to find problematic code in functions.

# Debugging tools are not a substitute for thinking!