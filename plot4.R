## This script will reconstruct the existing plots (plot 4) the household energy usage varies over a 2-day
## period 2007-02-01 and 2007-02-02    with 2,075,259 rows and 9 columns input file.

    ## Read Input file
    datainput <- "./data/household_power_consumption.txt"
    data <- read.table(datainput, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    
    ## Select only 2 days out of data_input file
    data_2days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
    
    #str(subSetData)
    datetime <- strptime(paste(data_2days$Date, data_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    globalActivePower <- as.numeric(data_2days$Global_active_power)
    globalReactivePower <- as.numeric(data_2days$Global_reactive_power)
    voltage <- as.numeric(data_2days$Voltage)
    
    ## sub Meterings
    subMetering1 <- as.numeric(data_2days$Sub_metering_1)
    subMetering2 <- as.numeric(data_2days$Sub_metering_2)
    subMetering3 <- as.numeric(data_2days$Sub_metering_3)
    
    ## Plot 4
    png("plot4.png", width=480, height=480)
    par(mfrow = c(2, 2)) 
    
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
    
    plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
    
    plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
    lines(datetime, subMetering2, type="l", col="red")
    lines(datetime, subMetering3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
    
    plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
    
    dev.off()