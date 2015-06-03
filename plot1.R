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
    datainput <- "./data/household_power_consumption.txt"
    data <- read.table(datainput, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

    ## Select only 2 days out of data_input file
    data_2days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

    ## Converting dates
    globalActivePower <- as.numeric(data_2days$Global_active_power)

    ## Plot 1
    png("plot1.png", width=480, height=480)
    hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    dev.off()
