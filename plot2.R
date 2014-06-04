# Author : Alicia Wang
# Date : 4 June 2014
# file : plot2.R
#
#--------------------------------------------------

##-------------------------------------------------
# plot2 plots the fluctuation of Global Active power / time 
# during the selecting days.
##
plot2 <- function(rawstartdate = "2007-02-01",
                  rawenddate = "2007-02-02",
                  directory = "../ExData",
                  filename = "household_power_consumption.txt") {
    
    effdata <- ReadBetweenDates(rawstartdate, rawenddate, directory, filename)
    
    # Get the Global Active Power
    gap <- as.numeric(effdata$Global_active_power)
    
    # Extract the date
    gdate <- paste(effdata$Date, effdata$Time)
    gdate <- strptime(gdate, "%d/%m/%Y %H:%M:%S")
    
    plot(gdate, gap, ylab = "Global Active Power(kilowatts)", xlab = "", type = "l")
    par(mar = c(5, 6, 6, 4))
    
    # Save the data in a .png file
    dev.copy(png, file = "plot2.png")
    dev.off()
}