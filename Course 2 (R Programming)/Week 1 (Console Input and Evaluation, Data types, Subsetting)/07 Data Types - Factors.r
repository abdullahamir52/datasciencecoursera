# R Data types: Factors
# Factors can be ordered(lecturer, professor) or un-ordered(Male,female)
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
# [1] yes yes no  yes no 
# Levels: no yes

table(x)
# x
#   no yes 
#   2   3 

unclass(x)
# [1] 2 2 1 2 1
# attr(,"levels")
# [1] "no"  "yes"

# To change the order of the levels
# Since no comes before yes, alphabetically, the primary level is no. 
# you can change it using the level function 
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x
# [1] yes yes no  yes no 
# Levels: yes no
