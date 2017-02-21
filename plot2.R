## This will create Plot 2 for the Cousera Exploratory Data Analysis week 1 assignment.
## To run this script:
##   1) set the working directory to the appropriate directory on your local machine 
##      by modifying the "setwd" function below.
##   2) download and locate the "household_power_consumption.txt" data set into
##      your working directory.
##   3) Make sure that the "dplyr" package is installed
##
## The rest is routine that is, source the code and run "plot2()" in your console

plot2 <- function() {

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
png(file = "plot2.png", width=480, height=480, units="px")

with(hp2days, {
  plot(DateTime, Global_active_power, type = "n", ylab="Global Active Power (kilowatts)", xlab="")
  lines(DateTime, Global_active_power)
  })

dev.off()  ## Turn off the png device

}
