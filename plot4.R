plot4 <- function() {
  
## Setup variables
    
filename <- "./DSS_wk1/household_power_consumption.txt"
    
## Read csv file

data <- read.csv2(filename, head=TRUE, sep=";")

## Pull out the data from the date ranage
data.ex <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Convert to numerics for plotting
data.ex$Sub_metering_1 <- as.numeric(as.character(data.ex$Sub_metering_1))
data.ex$Sub_metering_2 <- as.numeric(as.character(data.ex$Sub_metering_2))
data.ex$Sub_metering_3 <- as.numeric(as.character(data.ex$Sub_metering_3))
data.ex$Global_active_power <- as.numeric(as.character(data.ex$Global_active_power))
data.ex$Voltage <- as.numeric(as.character(data.ex$Voltage))
data.ex$Global_reactive_power <- as.numeric(as.character(data.ex$Global_reactive_power))

data.ex$Date <- as.character(data.ex$Date)
data.ex$Time <- as.character(data.ex$Time)
full_date <- strptime(paste(data.ex$Date, data.ex$Time), "%d/%m/%Y, %H:%M:%S")

## Set png file information
png("Plot4.png")

## Setup for 4 plots
par(mfrow=c(2,2))

## Plot the first graph
plot(xlab="", ylab="Global Active Power (kilowatts)",
     d, data.ex$Global_active_power, type="l")

## Plot the second graph
plot(xlab="datetime", ylab="Voltage",
     d, data.ex$Voltage, type="l")

## Plot the third graph - base graph first
plot(xlab="", ylab="Energy sub metering",
     d, data.ex$Sub_metering_1, type="l", col="black")

## Add the extra lines
lines(d, data.ex$Sub_metering_2, col="red")
lines(d, data.ex$Sub_metering_3, col="blue")

## Add the legend
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), lwd=c(1,1,1),
       bty="n")

## Plot the fourth graph
plot(xlab="datetime", ylab="Global_reactive_power",
     d, data.ex$Global_reactive_power, type="l")

## Turn png file plotting off
dev.off()

}