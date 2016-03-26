plot3 <- function() {
  
## Setup variables
    
filename <- "./DSS_wk1/household_power_consumption.txt"
    
## Read csv file

data <- read.csv2(filename, head=TRUE, sep=";")

## Pull out the data from the date ranage
data.ex <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Convert to numerics por plotting
data.ex$Sub_metering_1 <- as.numeric(as.character(data.ex$Sub_metering_1))
data.ex$Sub_metering_2 <- as.numeric(as.character(data.ex$Sub_metering_2))
data.ex$Sub_metering_3 <- as.numeric(as.character(data.ex$Sub_metering_3))

data.ex$Date <- as.character(data.ex$Date)
data.ex$Time <- as.character(data.ex$Time)
full_date <- strptime(paste(data.ex$Date, data.ex$Time), "%d/%m/%Y, %H:%M:%S")

## Set png file information
png("Plot3.png")

## Plot the base graph
plot(xlab="", ylab="Energy sub metering",
     d, data.ex$Sub_metering_1, type="l", col="black")

## Add the extra lines
lines(d, data.ex$Sub_metering_2, col="red")
lines(d, data.ex$Sub_metering_3, col="blue")

## Add the legend
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), lwd=c(1,1,1))

## Turn png file plotting off
dev.off()

}