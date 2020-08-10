# ----------------------------------------------------
# Chapter 2: Workspace and Files

# Determine the current working directory
getwd()

# List all the objects in your local workspace using ls().
ls()

# List all the files in your working directory using list.files() or dir().
list.files()
dir()

# Using the args() function on a function name is also a handy way to see what
# arguments a function can take.
args(list.files) 

# Type old.dir <- getwd() to assign the value of the current working directory to
# a variable called "old.dir".
old.dir<- getwd()

# Type dir.create("testdir") to create a directory in the current working
# directory called "testdir".
dir.create("testdir")

# Set your working directory to "testdir" with the setwd() command.
setwd("testdir")

# Create a file in your working directory called "mytest.R" using the
# file.create() function.
file.create("mytest.R")

# This should be the only file in this newly created directory. Let's check this
# by listing all the files in the current directory.
dir()
list.files() 

# Check to see if "mytest.R" exists in the working directory using the
# file.exists() function.
file.exists("mytest.R")

# Access information about the file "mytest.R" by using file.info().
file.info("mytest.R")

# You can use the $ operator --- e.g., file.info("mytest.R")$mode --- to grab
# specific items.
file.info("mytest.r")$mtime
file.info("mytest.r")$exe

# Change the name of the file "mytest.R" to "mytest2.R" by using file.rename().
file.rename("mytest.R", "mytest2.R")

# to remove/delete a file
file.remove('mytest.R')

# Make a copy of "mytest2.R" called "mytest3.R" using file.copy().
file.copy("mytest2.R", "mytest3.R")

# Provide the relative path to the file "mytest3.R" by using file.path().
file.path("mytest3.R")

# You can use file.path to construct file and directory paths that are 
# independent of the operating system your R code is running on. Pass 'folder1' 
# and 'folder2' as arguments to file.path to make a platform-independent pathname.
file.path("folder1", "folder2")

# Take a look at the documentation for dir.create by entering ?dir.create . 
# Notice the 'recursive' argument. In order to create nested directories, 
# 'recursive' must be set to TRUE.
?dir.create

# Create a directory in the current working directory called "testdir2" and a
# subdirectory for it called "testdir3", all in one command by using dir.create()
# and file.path().
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)

# Go back to your original working directory using setwd(). 
# (Recall that we created the variable old.dir with the full path for the 
# orginal working directory at the start of these questions.)
setwd(old.dir)

# After you finish this lesson delete the 'testdir' directory that you just left
# (and everything in it)
unlink("testdir", recursive = TRUE)
# If recursive = FALSE directories are not deleted, not even empty ones.
# file.remove() can only remove files, but gives more detailed error info