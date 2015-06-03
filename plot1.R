## This script will reconstruct the existing plots the household energy usage varies over a 2-day
## period 2007-02-01 and 2007-02-02    with 2,075,259 rows and 9 columns input file.

## Read data file

data_input <- read.csv("C:/Luc/Coursera/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Select only 2 days out of data_input file
data_2days <- data_input[data_input$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting dates
datetime <- paste(as.Date(data_2days$Date), data_2days$Time)
data_2days$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data_2days$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to a file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
