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
    
    # Get the related data
    sub1 <- as.numeric(effdata$Sub_metering_1)
    sub2 <- as.numeric(effdata$Sub_metering_2)
    sub3 <- as.numeric(effdata$Sub_metering_3)
    
    
    par(mfrow = c(1, 1), cex.lab = 0.8, cex.axis = 0.8)
    
    plot(gdate,  sub1, type="l", col = "black", 
         xlab = "", ylab = "Energy sub metering")
    lines(gdate, sub2, type="l", col = "red")
    lines(gdate, sub3, type="l", col = "blue")
    
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), cex = 0.8,
           lty = 1)
    
    # Save the data in a .png file
    dev.copy(png, file = "plot3.png")
    dev.off()
}