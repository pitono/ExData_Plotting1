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
png("plot3.png", width=480, height=480, bg="transparent")
## png("plot3.png", width=480, height=480, bg="white")

## Plot the data
plot(data$Time, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"))

## Turn off device and turn off all warning message
g <- dev.off()

