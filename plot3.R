#### 3rd Plot 
library(dplyr)
data <- read.delim("C:/repo/Exploratory Data Analysis/household_power_consumption.txt",sep = ";")


data$Date <- as.Date(data$Date,"%d/%m/%Y")


sub_data<- subset(data,Date == "2007/02/01" | Date == "2007/02/02")

sub_data$Sub_metering_1 <- as.character(sub_data$Sub_metering_1)

sub_data$Sub_metering_1 <- as.numeric(sub_data$Sub_metering_1)

sub_data$Sub_metering_2 <- as.character(sub_data$Sub_metering_2)

sub_data$Sub_metering_2 <- as.numeric(sub_data$Sub_metering_2)

sub_data$Sub_metering_3 <- as.character(sub_data$Sub_metering_3)

sub_data$Sub_metering_3 <- as.numeric(sub_data$Sub_metering_3)

cols  = c("black","red","blue")

getwd()

png("3rdplot.png", width = 350, height = "350")

plot(sub_data$Sub_metering_1 ~ as.POSIXct(paste(sub_data$Date, sub_data$Time)),type = "l", xlab = "",ylab = "Energy sub metering",col = "black")

lines(sub_data$Sub_metering_2 ~ as.POSIXct(paste(sub_data$Date, sub_data$Time)), col = "red")

lines(sub_data$Sub_metering_3 ~ as.POSIXct(paste(sub_data$Date, sub_data$Time)),col = "blue")

legend("topright",legend = c("Sub_metering_1","sub_metering_2","sub_metering_3"),col = c("black","red","blue"),lty = 1)

dev.off()
