# Partial Matching
# Partial matching of names is allowed with [[ and $.
x <- list(aardvark = 1:5)
x
# $aardvark
# [1] 1 2 3 4 5

# x is a list contains an element named aardvark 
x$a
# [1] 1 2 3 4 5
# this command looks for an element that has 'a' in it > partial matching

x[["a"]]
# NULL
# this command looks for an element named 'a', exact matching

x[["a", exact = FALSE]]
# [1] 1 2 3 4 5
# double bracket command with exact matching set to false> partial matching