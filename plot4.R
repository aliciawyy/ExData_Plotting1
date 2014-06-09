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
    
    # Extract the date
    gdate <- paste(effdata$Date, effdata$Time)
    gdate <- strptime(gdate, "%d/%m/%Y %H:%M:%S")
    
    # Set the frame
    par(mfrow = c(2, 2), mai = c(0.8, 0.8, 0.2, 0.1), cex.lab = 0.7, cex.axis = 0.8)
    
    # Get the Global Active Power
    gap <- as.numeric(effdata$Global_active_power)
       
    plot(gdate, gap, ylab = "Global Active Power", xlab = "",
         type = "l")
    
    # Get the voltage
    vl <- as.numeric(effdata$Voltage)
    plot(gdate, vl, ylab = "Voltage", xlab = "datetime",
         type = "l")
    
    # Get the sub metering data
    sub1 <- as.numeric(effdata$Sub_metering_1)
    sub2 <- as.numeric(effdata$Sub_metering_2)
    sub3 <- as.numeric(effdata$Sub_metering_3)
    
    plot(gdate,  sub1, type="l", col = "black", 
         xlab = "", ylab = "Energy sub metering")
    lines(gdate, sub2, type="l", col = "red")
    lines(gdate, sub3, type="l", col = "blue")
    
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), cex = 0.7, bty = "n",
           lty = 1)
    
    # Get the Global Reactive Power
    gapre <- as.numeric(effdata$Global_reactive_power)
    
    plot(gdate, gapre, ylab = "Global Reactive Power", xlab = "datetime",
         type = "l")
    
    # Save the data in a .png file
    dev.copy(png, file = "plot4.png")
    dev.off()
}