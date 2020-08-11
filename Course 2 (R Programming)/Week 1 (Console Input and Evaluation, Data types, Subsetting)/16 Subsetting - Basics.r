# Subsetting Basics

# Single bracket returns the same data type
# double bracket returns a list/data.frame
char_vector <- c("a", "b", "c", "c", "d", "a")
char_vector[1]
char_vector[2]
char_vector[1:4]
# [1] "a" "b" "c" "c"
# the example above used the numeric index

char_vector[char_vector > "a"]
# [1] "b" "c" "c" "d"

logical_vector <- char_vector > "a"
logical_vector
# FALSE  TRUE  TRUE  TRUE  TRUE FALSE

char_vector[logical_vector]
# "b" "c" "c" "d"
# the example above used the logical index

