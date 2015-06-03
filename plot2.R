## This script will reconstruct the existing plots (plot 2) the household energy usage varies over a 2-day
## period 2007-02-01 and 2007-02-02    with 2,075,259 rows and 9 columns input file.

    ## Read Input file
    datainput <- "./data/household_power_consumption.txt"
    data <- read.table(datainput, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    
    ## Select only 2 days out of data_input file
    data_2days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

    #str(subSetData)
    datetime <- strptime(paste(data_2days$Date, data_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    globalActivePower <- as.numeric(data_2days$Global_active_power)
    
    ## Plot 2
    png("plot2.png", width=480, height=480)
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()