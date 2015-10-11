library(dplyr)
setwd("C:\\Users\\Selak\\Dropbox\\Coursera\\03 - Exploratory Analysis\\Project_1")
dataset2 <- read.table("household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
dataset2$Date2 <- as.Date(dataset2$Date,"%d/%m/%Y")
dataset <- dataset2[(dataset2$Date2 %in% as.Date(c('2007-02-01','2007-02-02'))),]
dataset$Time2 <- strptime(dataset$Time,"%H:%M:%S")
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
dataset$date_time <- paste(dataset$Date, dataset$Time)
dataset$date_time2 <- strptime(dataset$date_time,"%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width = 480, height = 480, pointsize = 12)
par(mar=c(3.1,4.1,4.1,2.1))
plot(dataset$date_time2, dataset$Global_active_power, type="l",
     xlab = "Day and Time",
     ylab="Global Active Power (kilowatts)"
     )
dev.off()

