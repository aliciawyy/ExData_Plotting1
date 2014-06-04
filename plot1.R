# Author : Alicia Wang
# Date : 4 June 2014
# 
#
#--------------------------------------------------


##-------------------------------------------------
# The function ReadBetweenDates read exactly the data between the dates
# "rawstartdate" and "rawenddate" in a large data file
##
ReadBetweenDates <- function(rawstartdate = "2007-02-01",
                             rawenddate = "2007-02-02",
                             directory = "../ExData",
                             filename = "household_power_consumption.txt") {
    
    # Assemble the full name of the data file with path
    fullname <- paste(directory, "/", filename, sep = "")
    
    # Read the first row of the data file
    DF.row1 <- read.csv(fullname, header = TRUE, sep = ";", nrows = 1)
    nc <- ncol(DF.row1)
    
    # Read the first column to get the date of each row
    DF.Date <- read.csv(fullname, header = TRUE, sep = ";", na.strings = "?", 
                        colClasses = c("character", rep("NULL", nc - 1)))
    
    # Convert the date format in the file to R format
    DF.Date.f <- strptime(DF.Date$Date, "%d/%m/%Y")
    
    # Set the start and end date
    startdate <- as.Date(rawstartdate)
    startdate <- as.POSIXct(startdate) - 60*60*2
    enddate <- as.Date(rawenddate)
    enddate <- as.POSIXct(enddate)
    
    print(startdate)
    print(enddate)
    
    nskip <- which.max(DF.Date.f > startdate)
    nend <- which.max(DF.Date.f > enddate)
    
    nreadrow <- nend - nskip - 1
    
    print(nskip)
    print(nend)
    print(nreadrow)
    
    # Only read between the start and end date of the file
    effdata <- read.csv(fullname, col.names = names(DF.row1), colClasses = "character", skip = nskip, 
                        nrow = nreadrow, sep = ";", na.strings = "?")
 
    print(head(effdata))
    print(tail(effdata))
    
    effdata
}

##-------------------------------------------------
#
#
##
plot1 <- function(rawstartdate = "2007-02-01",
                  rawenddate = "2007-02-02",
                  directory = "../ExData",
                  filename = "household_power_consumption.txt") {
    
    effdata <- ReadBetweenDates(rawstartdate, rawenddate, directory, filename)
    
    
    
    
    
    
}