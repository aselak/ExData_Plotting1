library(dplyr)
setwd("C:\\Users\\Selak\\Dropbox\\Coursera\\03 - Exploratory Analysis\\Project_1")
dataset2 <- read.table("household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
dataset2$Date2 <- as.Date(dataset2$Date,"%d/%m/%Y")
dataset <- dataset2[(dataset2$Date2 %in% as.Date(c('2007-02-01','2007-02-02'))),]
# dataset$date_time <- paste(dataset$Date, dataset$Time)
# dataset$date_time2 <- strptime(dataset$date_time,"%H:%M:%S")
dataset$Time2 <- strptime(dataset$Time,"%H:%M:%S")
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
png(filename="plot1.png", width = 480, height = 480, pointsize = 12)
hist(dataset$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
     )
dev.off()

