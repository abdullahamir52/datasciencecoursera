# to check the working directory
getwd()
# to see what files are in the directory
dir()
# to source the file into the R consule
source("my_code.r")

# Now to write a function
myfunction<- function(x)
{
	y<-rnorm(100)
	mean(y)
}

second<- function(x)
{
	x+rnorm(length(x))
}

# to see what functions does the file have that you loaded
ls()


myfunction()
second(4)
second(4)
second(4:10)