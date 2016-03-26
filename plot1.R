plot1 <- function() {
  
## Setup variables
    
filename <- "./DSS_wk1/household_power_consumption.txt"
    
## Read csv file

data <- read.csv2(filename, head=TRUE, sep=";")

## Pull out the data from the date ranage
data.ex <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Set png file information
png("Plot1.png")

## Plot the histogram
hist(xlab="Global Active Power (kilowatts)",
     as.numeric(as.character(data.ex$Global_active_power)),
     col="red", main ="Global Active Power", cex.lab=1)

## Turn png file plotting off
dev.off()

}