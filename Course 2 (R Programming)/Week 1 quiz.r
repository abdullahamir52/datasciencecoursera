# The 'rbind' function treats vectors as if they were rows of a matrix. 
# It then takes those vectors and binds them row-wise to create a matrix.
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)
#     [,1] [,2] [,3]
# x    1    3    5
# y    3    2   10


# What does x[[1]] give me? Select all that apply.
x <- list(2, "a", "b", TRUE)
b <-x[[1]]
class(b)
# [1] "numeric"
# a numeric vector containing the element 2 and length 1


# vector addition
x <- 1:4
y <- 2:3
x + y
# [1] 3 5 5 7


# I want to set all elements of this vector that are greater than 10 to be 
# equal to 4. What R code achieves this?
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4
x[x > 10] <- 4
x
# [1]  4  4  4  5  4  4 10


# to read the csv file
data <- read.csv("Week 1 quiz hw1_data.csv", header = TRUE, sep = ',')

# to get the first 2 rows
data[1:2,]
#     Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2


# to get the column names
names(data)
# [1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"    


# to get the number of rows
nrow(data)
# [1] 153


# to get the last part of the data
tail(data)
#       Ozone Solar.R Wind Temp Month Day
# 148    14      20 16.6   63     9  25
# 149    30     193  6.9   70     9  26
# 150    NA     145 13.2   77     9  27
# 151    14     191 14.3   75     9  28
# 152    18     131  8.0   76     9  29
# 153    20     223 11.5   68     9  30


# single bracket operator to extract a single row
data[47,]

# To get the number of missing values in a column of a dataframe
ozone <-data[,1]      # extracts the ozone column
bad <- is.na(ozone)   # gives a logical vector (with NA values giving True)
miss <- matrix(ozone[bad], nrow=1)  # creates a matrix of NA values from Ozone
ncol(miss) # shows the number of columns in that vector
# [1] 37

# to get the mean of one column, w/o the missing values
bad                 # gives a logical vector (with NA values giving True) 
ozone[!bad]         # shows the ozone vector w/o missing values
mean(ozone[!bad])   # calculates the mean of the previous vector



# Extract the subset of rows of the data frame where Ozone values are above 31 
# and Temp values are above 90. What is the mean of Solar.R in this subset?

# to subset the appropriate part of the data frame
m1  <- subset(data, Ozone > 31 & Temp > 90)
# also, check the subset definition

# alternatively
m1 <- data[ which(data$Ozone>31 & data$Temp > 90), ]

# alternatively
attach(data)
m1 <- data[ which(Ozone > 31 & Temp > 90), ]
detach(data)

# to get the mean of Solar.R
mean(m1[,2])
# [1] 212.8