# Household electric power consumption

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, the assignment examines the “Individual household electric power consumption Data Set”  made available on the course web site:
* Dataset: Electric power consumption [20Mb]
* Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

##The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
 1. Date: Date in format dd/mm/yyyy
 2. Time: time in format hh:mm:ss
 3. Global_active_power: household global minute-averaged active power (in kilowatt)
 4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
 5. Voltage: minute-averaged voltage (in volt)
 6. Global_intensity: household global minute-averaged current intensity (in ampere)
 7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
 8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
 9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

##When loading the dataset into R, please consider the following:
* The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
* We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
* You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
* Note that in this dataset missing values are coded as ?.

##For each plot you should
* Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
* Name each of the plot files as plot1.png, plot2.png, etc.
* Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
* Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.

The four plots and scripts are located in this repository

##To run each script
 1. set the working directory to the appropriate directory on your local machine by modifying the "setwd" function below.
 2. download and locate the "household_power_consumption.txt" data set into your working directory.
 3. Make sure that the "dplyr" package is installed
