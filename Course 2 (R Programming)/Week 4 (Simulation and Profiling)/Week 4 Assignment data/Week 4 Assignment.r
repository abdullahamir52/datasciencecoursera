# Bring the "best.R" and "rankhospital.R" in the working directory.

# 1 Plot the 30-day mortality rates for heart attack
#-----------------------------------------------------

# to read the outcome file
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# To get an idea about the outcome file's data
head(outcome)

# To see the name of the columns
names(outcome)

# To make a simple histogram of the 30-day death rates from heart attack 
# (column 11 in the outcome dataset), run
outcome[, 11] <- as.numeric(outcome[, 11])

# You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])
# check Week 4 assignment 1.png

# Because we originally read the data in as character (by specifying 
# colClasses = "character" we need to coerce the column to be numeric. You may 
# get a warning about NAs being introduced but that is okay.



# Alternate Part 2 Finding the best hospital in a state
# ------------------------------------------------------

# Write a function called best that take two arguments: the 2-character 
# abbreviated name of a state and an outcome name.
# The function reads the outcome-of-care-measures.csv file and returns a 
# character vector with the name of the hospital that has the best 
# (i.e. lowest) 30-day mortality for the specified outcome in that state. The 
# hospital name is the name provided in the Hospital.Name variable. The outcomes
# can be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that 
# do not have data on a particular outcome should be excluded from the set of 
# hospitals when deciding the rankings. 

# Handling ties. If there is a tie for the best hospital for a given outcome, 
# then the hospital names should be sorted in alphabetical order and the first 
# hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and “f” 
# are tied for best, then hospital “b” should be returned). The function should 
# use the following template.


best <- function(state, outcome) {
  
  ## All of the possible outcome strings
  outcomes = c("heart attack", "heart failure", "pneumonia")
  
  ## Check if outcome is one of the strings in outcomes
  ## %in% is a more intuitive interface as a binary operator, which 
  ## returns a logical vector indicating if there is a match or not
  if( outcome %in% outcomes == FALSE ) {
    stop("invalid outcome")
  }
  
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Get the columns below from 'data' and place it in 'data' with new 
  ## names ("name", "state", "heart attack", etc)
  #"Hospital.Name"                                              
  #"State"                                                     
  #"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
  #"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  #"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    
  
  data <- data[c(2, 7, 11, 17, 23)]
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"
  
  ## Get a vector of all of the states in 'data' now at column 2, 
  ## NOTE: could've also used data["state"]
  states <- data[, 2]
  states <- unique(states)
  if( state %in% states == FALSE ) {
    stop("invalid state")
  }
  
  ## Get only the rows with our state value	
  data <- data[data$state==state & data[outcome] != 'Not Available', ]
  vals <- data[, outcome]
  
  ## RowNum = the index of the minimum value 
  rowNum <- which.min(vals)
  
  ## Return hospital name in that state with lowest 30-day death rate
  data[rowNum, ]$name
}


# The function should check the validity of its arguments. If an invalid state 
# value is passed to best, the function should throw an error via the stop 
# function with the exact message \invalid state". If an invalid outcome value 
# is passed to best, the function should throw an error via the stop function 
# with the exact message \invalid outcome". Here is some sample output from 
# the function.

source("best.R")

best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"

best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"

best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state

best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome


# Alternate Solution Part 3 Ranking hospitals by outcome in a state
# ------------------------------------------------------------------

# Write a function called rankhospital that takes three arguments: the 
# 2-character abbreviated name of a state (state), an outcome (outcome), and 
# the ranking of a hospital in that state for that outcome (num). The function 
# reads the outcome-of-care-measures.csv file and returns a character vector 
# with the name of the hospital that has the ranking specified by the num 
# argument. For example, the call 
# rankhospital("MD", "heart failure", 5)
# would return a character vector containing the name of the hospital with the 
# 5th lowest 30-day death rate for heart failure. The num argument can take 
# values \best", \worst", or an integer indicating the ranking (smaller numbers 
# are better). If the number given by num is larger than the number of hospitals 
# in that state, then the function should return NA. Hospitals that do not have 
# data on a particular outcome should be excluded from the set of hospitals 
# when deciding the rankings. 

# Handling ties. It may occur that multiple hospitals have the same 30-day 
# mortality rate for a given cause of death. In those cases ties should be 
# broken by using the hospital name. For example, in Texas (\TX"), the 
# hospitals with lowest 30-day mortality rate for heart failure are shown here.

# head(texas)
#                          Hospital.Name  Rate  Rank
# 3935        FORT DUNCAN MEDICAL CENTER   8.1   1
# 4085   TOMBALL REGIONAL MEDICAL CENTER   8.5   2
# 4103  CYPRESS FAIRBANKS MEDICAL CENTER   8.7   3
# 3954            DETAR HOSPITAL NAVARRO   8.7   4
# 4010            METHODIST HOSPITAL,THE   8.8   5
# 3962   MISSION REGIONAL MEDICAL CENTER   8.8   6

# The function should use the following template.


rankhospital <- function(state, outcome, num) {
  
  
  ## Read outcome data .csv file
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- data[c(2, 7, 11, 17, 23)]
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"
  
  ## All of the possible outcome strings
  outcomes = c("heart attack", "heart failure", "pneumonia")
  ## Check if outcome is one of the strings in outcomes
  if( outcome %in% outcomes == FALSE ) {
    stop("invalid outcome")
  }
  
  ## Validate the state string
  ## All of the possible states from the data
  states <- data[, 2]
  states <- unique(states)
  ## Check if state is one of the states in the data
  if( state %in% states == FALSE ) {
    stop("invalid state")
  }
  
  ## Validate the num value by checking if it is "best","worst", or a number.
  ## NOTE: If num was Boolean then num%%1 = 0
  if( num != "best" && num != "worst" && num%%1 != 0 ) {
    stop("invalid num")
  }
  
  ## Get only the rows with our state value    
  data <- data[data$state==state & data[outcome] != 'Not Available', ]
  
  ## Order the data by name and then outcome
  data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
  data <- data[order(data$name, decreasing = FALSE), ]
  data <- data[order(data[outcome], decreasing = FALSE), ]
  
  ## Process the num argument to get the row index
  vals <- data[, outcome]
  if( num == "best" ) {
    rowNum <- which.min(vals)
  } else if( num == "worst" ) {
    rowNum <- which.max(vals)
  } else {
    rowNum <- num
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  data[rowNum, ]$name
}



# The function should check the validity of its arguments. If an invalid state 
# value is passed to rankhospital, the function should throw an error via the 
# stop function with the exact message \invalid state". If an invalid outcome 
# value is passed to rankhospital, the function should throw an error via the 
# stop function with the exact message \invalid outcome".

# Here is some sample output from the function.

source("rankhospital.R")

rankhospital("TX", "heart failure", 4)
# [1] "DETAR HOSPITAL NAVARRO"

rankhospital("MD", "heart attack", "worst")
# [1] "HARFORD MEMORIAL HOSPITAL"

rankhospital("MN", "heart attack", 5000)
# [1] NA




# Alternate Solution Part 4 Ranking hospitals in all states
# ----------------------------------------------------------

# Write a function called rankall that takes two arguments: an outcome name 
# (outcome) and a hospital ranking (num). The function reads the 
# outcome-of-care-measures.csv file and returns a 2-column data frame 
# containing the hospital in each state that has the ranking specified in num. 
# For example the function call rankall("heart attack", "best") would return a 
# data frame containing the names of the hospitals that are the best in their 
# respective states for 30-day heart attack death rates. The function should 
# return a value for every state (some may be NA). The first column in the data 
# frame is named hospital, which contains the hospital name, and the second 
# column is named state, which contains the 2-character abbreviation for the 
# state name. Hospitals that do not have data on a particular outcome should 
# be excluded from the set of hospitals when deciding the rankings.

# Handling ties. The rankall function should handle ties in the 30-day mortality 
# rates in the same way that the rankhospital function handles ties. The 
# function should use the following template.


rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- data[c(2, 7, 11, 17, 23)]
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"
  
  ## Validate the outcome string
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
  
  ## Validate the num value
  if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num")
  
  ## Grab only rows with data in our outcome
  data <- data[data[outcome] != 'Not Available', ]
  
  ## Order the data
  data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
  data <- data[order(data$name, decreasing = FALSE), ]
  data <- data[order(data[outcome], decreasing = FALSE), ]
  
  ## Helper functiont to process the num argument
  getHospByRank <- function(df, s, n) {
    df <- df[df$state==s, ]
    vals <- df[, outcome]
    if( n == "best" ) {
      rowNum <- which.min(vals)
    } else if( n == "worst" ) {
      rowNum <- which.max(vals)
    } else {
      rowNum <- n
    }
    df[rowNum, ]$name
  }
  
  ## For each state, find the hospital of the given rank
  states <- data[, 2]
  states <- unique(states)
  newdata <- data.frame("hospital"=character(), "state"=character())
  for(st in states) {
    hosp <- getHospByRank(data, st, num)
    newdata <- rbind(newdata, data.frame(hospital=hosp, state=st))
  }
  
  ## Return a data frame with the hospital names and the (abbreviated) state name
  newdata <- newdata[order(newdata['state'], decreasing = FALSE), ]
  newdata
}


# NOTE: For the purpose of this part of the assignment (and for efficiency), 
# your function should NOT call the rankhospital function from the previous 
# section.

# The function should check the validity of its arguments. If an invalid 
# outcome value is passed to rankall, the function should throw an error via 
# the stop function with the exact message \invalid outcome". The num variable 
# can take values \best", \worst", or an integer indicating the ranking 
# (smaller numbers are better). If the number given by num is larger than the 
# number of hospitals in that state, then the function should return NA.

# Here is some sample output from the function.

source("rankall.R")

head(rankall("heart attack", 20), 10)
# Output
#                               hospital state
# 42                                <NA>    AK
# 40      D W MCMILLAN MEMORIAL HOSPITAL    AL
# 11   ARKANSAS METHODIST MEDICAL CENTER    AR
# 16 JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
# 4                SHERMAN OAKS HOSPITAL    CA
# 24            SKY RIDGE MEDICAL CENTER    CO
# 5              MIDSTATE MEDICAL CENTER    CT
# 49                                <NA>    DC
# 31                                <NA>    DE
# 19      SOUTH FLORIDA BAPTIST HOSPITAL    FL

tail(rankall("pneumonia", "worst"), 3)
# Output
#                                      hospital state
# 28 MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
# 36                     PLATEAU MEDICAL CENTER    WV
# 41           NORTH BIG HORN HOSPITAL DISTRICT    WY

tail(rankall("heart failure"), 10)
# Output
#                                                             hospital state
# 36                         WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL    TN
# 12                                        FORT DUNCAN MEDICAL CENTER    TX
# 50 VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER    UT
# 15                                          SENTARA POTOMAC HOSPITAL    VA
# 54                            GOV JUAN F LUIS HOSPITAL & MEDICAL CTR    VI
# 52                                              SPRINGFIELD HOSPITAL    VT
# 23                                         HARBORVIEW MEDICAL CENTER    WA
# 31                                    AURORA ST LUKES MEDICAL CENTER    WI
# 38                                         FAIRMONT GENERAL HOSPITAL    WV
# 47                                        CHEYENNE VA MEDICAL CENTER    WY



# 2 Finding the best hospital in a state
# ---------------------------------------

best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}

best <- function(state, outcome) {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  # Column name is same as variable so changing it 
  chosen_state <- state 
  
  # Check that state and outcome are valid
  if (!chosen_state %in% unique(out_dt[["State"]])) {
    stop('invalid state')
  }
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  #Filter by state
  out_dt <- out_dt[state == chosen_state]
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  
  # Removing Missing Values for numerical datatype (outcome column)
  out_dt <- out_dt[complete.cases(out_dt),]
  
  # Order Column to Top 
  out_dt <- out_dt[order(get(outcome), `hospital name`)]
  
  return(out_dt[, "hospital name"][1])
  
}


# Part 3 Ranking hospitals by outcome in a state (rankhospital.R)
# -----------------------------------------------------------------

rankhospital <- function(state, outcome, num = "best") {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  # Column name is same as variable so changing it 
  chosen_state <- state 
  
  # Check that state and outcome are valid
  if (!chosen_state %in% unique(out_dt[["State"]])) {
    stop('invalid state')
  }
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  #Filter by state
  out_dt <- out_dt[state == chosen_state]
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  
  # Removing Missing Values for numerical datatype (outcome column)
  out_dt <- out_dt[complete.cases(out_dt),]
  
  # Order Column to Top 
  out_dt <- out_dt[order(get(outcome), `hospital name`)]
  
  out_dt <- out_dt[,  .(`hospital name` = `hospital name`, state = state, rate = get(outcome), Rank = .I)]
  
  if (num == "best"){
    return(out_dt[1,`hospital name`])
  }
  
  if (num == "worst"){
    return(out_dt[.N,`hospital name`])
  }
  
  return(out_dt[num,`hospital name`])
  
}



# Part 4 Ranking hospitals in all states (rankall.R)
# ------------------------------------------------------

rankall <- function(outcome, num = "best") {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  
  # Change outcome column class
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  if (num == "best"){
    return(out_dt[order(state, get(outcome), `hospital name`)
                  , .(hospital = head(`hospital name`, 1))
                  , by = state])
  }
  
  if (num == "worst"){
    return(out_dt[order(get(outcome), `hospital name`)
                  , .(hospital = tail(`hospital name`, 1))
                  , by = state])
  }
  
  return(out_dt[order(state, get(outcome), `hospital name`)
                , head(.SD,num)
                , by = state, .SDcols = c("hospital name") ])
  
}