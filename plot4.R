# Author : Alicia Wang
# Date : 4 June 2014
# file : plot4.R
#
#--------------------------------------------------

##-------------------------------------------------
#
#
##
plot4 <- function(rawstartdate = "2007-02-01",
                  rawenddate = "2007-02-02",
                  directory = "../ExData",
                  filename = "household_power_consumption.txt") {
    
    effdata <- ReadBetweenDates(rawstartdate, rawenddate, directory, filename)
    
    # Get the Global Active Power
    gap <- as.numeric(effdata$Global_active_power)
    
    # Extract the date
    gdate <- paste(effdata$Date, effdata$Time)
    gdate <- strptime(gdate, "%d/%m/%Y %H:%M:%S")
    
    # Save the data in a .png file
    dev.copy(png, file = "plot4.png")
    dev.off()
}