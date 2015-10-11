# Load Data
setwd("C:\\Users\\Selak\\Dropbox\\Coursera\\03 - Exploratory Analysis\\Project_1")
dataset2 <- read.table("household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
# Get subset of data needed
dataset2$Date2 <- as.Date(dataset2$Date,"%d/%m/%Y")
dataset <- dataset2[(dataset2$Date2 %in% as.Date(c('2007-02-01','2007-02-02'))),]
# Convert to proper types
dataset$Time2 <- strptime(dataset$Time,"%H:%M:%S")
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
dataset$date_time <- paste(dataset$Date, dataset$Time)
dataset$date_time2 <- strptime(dataset$date_time,"%d/%m/%Y %H:%M:%S")
dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
dataset$Voltage <- as.numeric(dataset$Voltage)
dataset$Global_reactive_power <- as.numeric(dataset$Global_reactive_power)

# Create Plot and add lines and legend

png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
par(mar=c(3.1,4.1,4.1,2.1))
#Plot for Row 1, Col 1
plot(dataset$date_time2, dataset$Global_active_power, type="l",
     xlab = "Day and Time",
     ylab="Global Active Power (kilowatts)"
)
# Plot for Row 1, Col 2
plot(dataset$date_time2, dataset$Voltage, type="l",
     xlab ="Day and Time",
     ylab="Global Active Power (kilowatts)"
)
# Plot for Row 2, Col 1
plot(dataset$date_time2, dataset$Sub_metering_1, type="n",
     xlab ="Day and Time",
     ylab="Energy sub metering"
     )
lines(dataset$date_time2, dataset$Sub_metering_1, type="l")
lines(dataset$date_time2, dataset$Sub_metering_2, type="l", col="red")
lines(dataset$date_time2, dataset$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2,2,2), col=c("black","red","blue"))
# Plot for Row 2, Col 2
plot(dataset$date_time2, dataset$Global_active_power, type="l",
     xlab ="Day and Time",
     ylab="Global Reactive Power"
)

dev.off()

