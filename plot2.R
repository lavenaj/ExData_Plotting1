plot2 <- function() {
  
## Setup variables
    
filename <- "./DSS_wk1/household_power_consumption.txt"
    
## Read csv file

data <- read.csv2(filename, head=TRUE, sep=";")

## Pull out the data from the date ranage
data.ex <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Convert to numerics por plotting
data.ex$Global_active_power <- as.numeric(as.character(data.ex$Global_active_power))

data.ex$Date <- as.character(data.ex$Date)
data.ex$Time <- as.character(data.ex$Time)
full_date <- strptime(paste(data.ex$Date, data.ex$Time), "%d/%m/%Y, %H:%M:%S")

## Set png file information
png("Plot2.png")

## Plot the graph
plot(xlab="", ylab="Global Active Power (kilowatts)",
     d, data.ex$Global_active_power, type="l")

## Turn png file plotting off
dev.off()

}