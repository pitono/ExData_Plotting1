## Getting column names
column <- colnames(read.table("household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))

## Getting required data, only 2880 rows and skipping 66637 rows. 
## Column names is using the above vector
data <- read.table(file="household_power_consumption.txt", 
                  skip=66637, nrow=2880, sep=";", col.names=column)

## Converting Time column to time format
data$Time <- strptime(paste(data$Date,data$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
## Converting Date column to date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Open PNG file
png("plot4.png", width=480, height=480, bg="transparent")
## png("plot4.png", width=480, height=480, bg="white")

## Create 2 by 2 place for plot
## par(mfrow = c(2,2), mar = c(5,4,2,1))
par(mfrow = c(2,2))

## Plot 1st data
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## Plot 2nd data
plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot 3rd data
plot(data$Time, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", lty=c(1,1,1), col=c("black","red","blue"))

## Plot 4th data
plot(data$Time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Turn off device and turn off all warning message
g <- dev.off()

