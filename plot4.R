# Author : Alicia Wang
# Date : 4 June 2014
# 
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
    
    # Save the data in a .png file
    dev.copy(png, file = "plot4.png")
    dev.off()
}