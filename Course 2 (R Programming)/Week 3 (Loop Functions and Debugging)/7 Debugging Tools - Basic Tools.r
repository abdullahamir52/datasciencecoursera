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

# These are interactive tools specifically designed to allow you to pick 
# through a function. There’s also the more blunt technique of inserting 
# print/cat statements in the function.