# Author : Alicia Wang
# Date : 4 June 2014
# file : plot3.R
#
#--------------------------------------------------

##-------------------------------------------------
#
#
##
plot3 <- function(rawstartdate = "2007-02-01",
                  rawenddate = "2007-02-02",
                  directory = "../ExData",
                  filename = "household_power_consumption.txt") {
    
    effdata <- ReadBetweenDates(rawstartdate, rawenddate, directory, filename)
    
    # Extract the date
    gdate <- paste(effdata$Date, effdata$Time)
    gdate <- strptime(gdate, "%d/%m/%Y %H:%M:%S")
    
    # Save the data in a .png file
    dev.copy(png, file = "plot3.png")
    dev.off()
}