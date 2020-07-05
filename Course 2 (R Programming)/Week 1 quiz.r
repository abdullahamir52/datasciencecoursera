# The 'rbind' function treats vectors as if they were rows of a matrix. 
# It then takes those vectors and binds them row-wise to create a matrix.
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)


# What does x[[1]] give me? Select all that apply.
x <- list(2, "a", "b", TRUE)
b<-x[[1]]
class(b)
# a numeric vector containing the element 2 and length 1


# vector addition
x <- 1:4
y <- 2:3
x + y


# I want to set all elements of this vector that are greater than 10 to be 
# equal to 4. What R code achieves this?
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4
x[x > 10] <- 4



# to read the csv file
data <- read.csv("Course 2 (R Programming) Week 1 quiz hw1_data.csv", header = TRUE, sep = ',')

# to get the first 2 rows
data[1:2,]

# to get the column names
names(data)

# to get the number of rows
nrow(data)

# to get the last part of the data
tail(data)

# single bracket operator to extract a single row
data[47,]

# To get the number of missing values in a column of a dataframe
ozone<-data[,1]
bad <- is.na(ozone)
miss<- matrix(ozone[bad],nrow=1)
ncol(miss)

# to get the mean of one column, w/o the missing values
bad
ozone[!bad]
mean(ozone[!bad])


# Extract the subset of rows of the data frame where Ozone values are above 31 
# and Temp values are above 90. What is the mean of Solar.R in this subset?

# to subset the appropriate part of the data frame
m1<-subset(data, Ozone > 31 & Temp > 90)
# alternatively
m1 <- data[ which(data$Ozone>31 & data$Temp > 90), ]
# alternatively
attach(data)
m1 <- data[ which(Ozone > 31 & Temp > 90), ]
detach(data)

# to get the mean of Solar.R
mean(m1[,2])



