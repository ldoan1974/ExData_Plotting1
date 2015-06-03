## This script will reconstruct the existing plots the household energy usage varies over a 2-day
## period 2007-02-01 and 2007-02-02    with 2,075,259 rows and 9 columns input file.

    ## Checking if folder data exists. If it doesn't exist then create a new one
    if(!file.exists("data")) {
        dir.create("data")
    }

    ## down load house_power_consumption file
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl,destfile="./data/exdata-data-household_power_consumption.zip")
    unzip(zipfile="./data/exdata-data-household_power_consumption.zip",exdir="./data")
    
    ## Read input file
    data_input <- read.csv("./data//household_power_consumption.txt", header=T, sep=';', na.strings="?", 
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
