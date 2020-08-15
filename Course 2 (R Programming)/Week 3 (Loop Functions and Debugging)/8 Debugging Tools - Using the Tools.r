# traceback
# -------------

mean(x)
# Error in mean(x) : object 'x' not found

traceback()
# 1: mean(x)

# The error just occurs like right away at the top of the mean function. 
# So the function mean didn't actually call any other functions.
# Because it couldn't evaluate your argument. And so, that's where the error 
# occurs so, you know that may or may not be. Many times that's just that is 
# where the error will occur at the top level function.
# in this case the trace-back's not very handy.




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

# When it evaluated the formula it couldn't find the actual value of y and x. 
# So that's where the error occurred. Printing out something like this can be 
# very useful. If you're trying to get help from someone else and you're kind 
# of trying to debug your function together.




# debug
# ----------

# First thing it will do is it will print out the entire code of the function, 
# and this is a lot longer than so I just cut cut it off in the middle here but 
# the first thing it does is it prints out the whole function body code. And 
# then you get this little prompt at the bottom here the browse. So now you're 
# in what's called the browser.And the browser is just like your r workspace.

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


# Press 'n' to go to the next line in the function
# Press 'Q' to exit the browser function




# Recover
# -------------------

# I'm going to read that csv some file that doesn't exist. I get an error 
# message, cannot open the connection. And get some warning also. But instead 
# of getting my console back, I get a little menu here. And this menu is the 
# function call stack.

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