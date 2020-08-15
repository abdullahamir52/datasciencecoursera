# Debugging Tools in R
# -------------------------------------

# The primary tools for debugging functions in R are

# 1. traceback: prints out the function call stack after an error occurs; 
# does nothing if there’s no error

# 2. debug: flags a function for “debug” mode which allows you to step through 
# execution of a function one line at a time

# 3. browser: suspends the execution of a function wherever it is called and 
# puts the function in debug mode

# 4. trace: allows you to insert debugging code into a function a specific places

# 5. recover: allows you to modify the error behavior so that you can browse the 
# function call stack


# Traceback just tells you how many function calls you're in and 
# where the error occurred

# So you give debug function another function as an argument, and it flags 
# that function for debug mode. Debug means anytime you execute that function, 
# anytime, anywhere even if another function calls it, it will, it will halt, 
# it will suspend execution of the function at the first line, and then you 
# can, in what's called a browser.

# The browser function's relativity to debug in the sense that you can stick 
# call to the browser function anywhere in your code, and when that line of 
# code gets hit the execution of the function will suspend. And then you can 
# go line by line from there.

# Recover is an error handler function which means that any time you encounter 
# an error anywhere in a function, rather than getting the console back the R 
# interpreter will stop the execution of that function right where the error 
# occurred, and will kind of freeze it there. And then it will print out the
# function call stack, so you'll see how far deep you're in, and then you can 
# go, you can kind of jump around to the different function calls to see, 
# and to look around. 

# These are interactive tools specifically designed to allow you to pick 
# through a function. There’s also the more blunt technique of inserting 
# print/cat statements in the function.