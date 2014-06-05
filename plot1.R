# Author : Alicia Wang
# Date : 4 June 2014
# file : plot1.R
#
#--------------------------------------------------

##-------------------------------------------------
# Global variable
# It is used to cache the data.
##
ExtractData <- NULL 

##-------------------------------------------------
# Clear the cache if you want to change the dates to analyze.
##
ClearExtractData <- function() { ExtractData <<- NULL }

##-------------------------------------------------
# The function ReadBetweenDates read exactly the data between the dates
# "rawstartdate" and "rawenddate" in a large data file
##
ReadBetweenDates <- function(rawstartdate = "2007-02-01",
                             rawenddate = "2007-02-02",
                             directory = "../ExData",
                             filename = "household_power_consumption.txt") {
    
    if ( !is.null(ExtractData) ) {
        message("Getting cached data.")
        return(ExtractData)
    }
    
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
    startdate <- as.POSIXct(startdate) - 60*60*2 # Set the startdate one day back
    enddate <- as.Date(rawenddate)
    enddate <- as.POSIXct(enddate)
    
    print(startdate)
    print(enddate)
    
    nskip <- which.max(DF.Date.f > startdate) - 1  # The number of rows to skip
    nend <- which.max(DF.Date.f > enddate) - 1     # The last data of the enddate
    
    nreadrow <- nend - nskip 
    
    print(nskip)
    print(nend)
    print(nreadrow)
    
    # Only read between the start and end dates of the file
    ExtractData <<- read.csv(fullname, col.names = names(DF.row1), colClasses = "character", skip = nskip, 
                        nrow = nreadrow, sep = ";", na.strings = "?")
 
    print(head(ExtractData))
    print(tail(ExtractData))
    
    ExtractData
}

##-------------------------------------------------
# plot1 plots a histogram of Global Active power during the selecting days.
# 
##
plot1 <- function(rawstartdate = "2007-02-01",
                  rawenddate = "2007-02-02",
                  directory = "../ExData",
                  filename = "household_power_consumption.txt") {
    
    effdata <- ReadBetweenDates(rawstartdate, rawenddate, directory, filename)
    
    # Get the Global Active Power
    gap <- as.numeric(effdata$Global_active_power)
    
    par(mfrow = c(1, 1), cex.lab = 0.8, cex.axis = 0.8)
    
    hist(gap, xlab = "Global Active Power(kilowatts)",
         ylab = "Frequency", main = "Global Active Power", col = "red")
    par(mar = c(5, 6, 6, 4))
    
    # Save the data in a .png file
    dev.copy(png, file = "plot1.png")
    dev.off()
    
}