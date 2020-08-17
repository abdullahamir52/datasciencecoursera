# My solve
# -------------

# Question 1
# --------------

# Take a look at the 'iris' dataset that comes with R. The data can be 
# loaded with the code:
  
library(datasets)   # loads the dataset
data(iris)          # loads the iris data set


# A description of the dataset can be found by running: 

?iris               # shows the descripton of the iris dataset

# There will be an object called 'iris' in your workspace. In this dataset, 
# what is the mean of 'Sepal.Length' for the species virginica? 
# Please round your answer to the nearest whole number.

# (Only enter the numeric result and nothing else.)


f <- gl(3, 50)      # creates a factor of 3 levels with 50 elements in each
f
# Output
# [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# [35] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
# [69] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3
# [103] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
# [137] 3 3 3 3 3 3 3 3 3 3 3 3 3 3

column1 <- iris[,1] # separtes the first column with sepal.length

tapply(column1, f, mean)
# applies the mean function on the 1st, 2nd and 3rd part of column1
# Output
#     1     2     3 
# 5.006 5.936 6.588 

# Answer: 7



# Question 2
# --------------

# Continuing with the 'iris' dataset from the previous Question, 
# what R code returns a vector of the means of the variables 
# 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
  

rowMeans(iris[, 1:4])
apply(iris, 1, mean)
apply(iris[, 1:4], 2, mean)
apply(iris, 2, mean)
colMeans(iris)
apply(iris[, 1:4], 1, mean)

# Answer: apply(iris[, 1:4], 2, mean)


# Question 3
# --------------

# Load the 'mtcars' dataset in R with the following code: 
library(datasets)
data(mtcars)



# There will be an object names 'mtcars' in your workspace. 
# You can find some information about the dataset by running: 
?mtcars


# How can one calculate the average miles per gallon (mpg) by number of 
# cylinders in the car (cyl)? Select all that apply.
apply(mtcars, 2, mean)
sapply(mtcars, cyl, mean)
mean(mtcars$mpg, mtcars$cyl)
lapply(mtcars, mean)
tapply(mtcars$mpg, mtcars$cyl, mean)          # right
sapply(split(mtcars$mpg, mtcars$cyl), mean)   # right
tapply(mtcars$cyl, mtcars$mpg, mean)
split(mtcars, mtcars$cyl)
with(mtcars, tapply(mpg, cyl, mean))          # right

# Output
#        4        6        8 
# 26.66364 19.74286 15.10000 



# Question 4
# --------------

# Continuing with the 'mtcars' dataset from the previous Question, what is the 
# absolute difference between the average horsepower of 4-cylinder cars and the 
# average horsepower of 8-cylinder cars?

# (Please round your final answer to the nearest whole number)

m <- split(mtcars, mtcars$cyl)
m2 <- m[["4"]]
m2_mean <- mean(m2$hp)

m3 <- m[["8"]]
m3_mean <- mean(m3$hp)

m3_mean - m2_mean
# [1] 126.5779



# Question 5
# --------------

# If you run
debug(ls)

# what happens when you next call the 'ls' function?

# 1. Execution of the 'ls' function will suspend at the 4th line of the function 
# and you will be in the browser.

# 2. You will be prompted to specify at which line of the function you would 
# like to suspend execution and enter the browser.

# 3. The 'ls' function will return an error.

# 4. Execution of 'ls' will suspend at the beginning of the function and you 
# will be in the browser.

# Answer: 4


# Other solve
# -------------

# Question 1
# -------------

library(datasets)
data(iris)
library(data.table)
iris_dt <- as.data.table(iris)
iris_dt[Species == "virginica",round(mean(Sepal.Length)) ]
# [1] 7



# Question 3
# --------------

mtcars_dt <- as.data.table(mtcars)
mtcars_dt <- mtcars_dt[,  .(mean_cols = mean(hp)), by = cyl]
round(abs(mtcars_dt[cyl == 4, mean_cols] - mtcars_dt[cyl == 8, mean_cols]))
# [1] 127

