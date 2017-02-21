## This will create Plot 4 for the Cousera Exploratory Data Analysis week 1 assignment.
## To run this script:
##   1) set the working directory to the appropriate directory on your local machine 
##      by modifying the "setwd" function below.
##   2) download and locate the "household_power_consumption.txt" data set into
##      your working directory.
##   3) Make sure that the "dplyr" package is installed
##
## The rest is routine that is, source the code and run "plot4()" in your console

plot4 <- function() {

setwd("D:/Coursera/04 Exploratory Data Analysis/Week 1/householdpower")

library(dplyr)

## First reduce the file to a workable size
hpcolnames <- c("Date","Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

hpdata <- read.table("./household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?", as.is = TRUE)

hpdata$Date <- as.Date(hpdata$Date, "%d/%m/%Y")  ## convert the Date string to real date

hp2days <- filter(hpdata, Date >= "2007-2-1" & Date < "2007-2-3") ## Filter and reduce the data set

## Convert the character Date and Time to a Date/Time with strptime
DateTime <- paste(hp2days$Date,hp2days$Time)  ## Combine the date and time
DateTime <- strptime( DateTime, "%Y-%m-%d %H:%M:%S", tz="GMT")

## Replace with Date and Time
hp2days <- cbind(DateTime, hp2days) ## add the DateTime to the data set
hp2days <- select(hp2days, -(Date:Time))  # remove the character Date and character Time

## Open png device and create the png in my working directory
png(file = "plot4.png", width=480, height=480, units="px")

par(mfrow = c(2,2))

with(hp2days, {
  ## Plot the Global Active Power vs datetime - upper left
  plot(DateTime, Global_active_power, type = "n", ylab="Global Active Power", xlab="")
  lines(DateTime, Global_active_power)
  
  ## Plot Voltage vs datetime - upper right
  plot(DateTime, Voltage, type = "n", xlab="datetime")  ## literally matching x label on assignment
  lines(DateTime, Voltage)
  
  ## Plot the Enger sub metering vs datetime - lower left
  ## Note: turn off the legend box border
  plot(DateTime, Sub_metering_1, type ="n",xlab="", ylab="Engery sub metering")
  points(DateTime, Sub_metering_2, type ="n")
  points(DateTime, Sub_metering_3, type ="n")
  lines(DateTime, Sub_metering_1)
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"), bty="n")
  
  ## Plot the Global reactive power vs datetime - lower right
  plot(DateTime, Global_reactive_power, type = "n", xlab="datetime")
  lines(DateTime, Global_reactive_power)
})

dev.off()  ## Turn off the png device

}
