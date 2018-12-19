###### 4th plot
library(dplyr)
data <- read.delim("C:/repo/Exploratory Data Analysis/household_power_consumption.txt",sep = ";")


data$Date <- as.Date(data$Date,"%d/%m/%Y")

sub_data<- subset(data,Date == "2007/02/01" | Date == "2007/02/02")

par(mfrow=c(2,2)) 

sub_data$Voltage

sub_data$Voltage <- as.character(sub_data$Voltage)

sub_data$Voltage <- as.numeric(sub_data$Voltage)

sub_data$Global_reactive_power <- as.character(sub_data$Global_reactive_power)

sub_data$Global_reactive_power <- as.numeric(sub_data$Global_reactive_power)


data$Global_active_power <- as.character(data$Global_active_power)

data$Global_active_power <- as.numeric(data$Global_active_power)

sub_data$Sub_metering_1 <- as.character(sub_data$Sub_metering_1)

sub_data$Sub_metering_1 <- as.numeric(sub_data$Sub_metering_1)

sub_data$Sub_metering_2 <- as.character(sub_data$Sub_metering_2)

sub_data$Sub_metering_2 <- as.numeric(sub_data$Sub_metering_2)

sub_data$Sub_metering_3 <- as.character(sub_data$Sub_metering_3)

sub_data$Sub_metering_3 <- as.numeric(sub_data$Sub_metering_3)

png("4thplot.png", width = 350, height = "350")



par(mfrow=c(2,2)) 

### 1st
with(sub_data,hist(Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power"))

### 2nd
plot(sub_data$Voltage ~ as.POSIXct(paste(sub_data$Date, sub_data$Time)),type = "l", xlab = "datetime",ylab = "Voltage",col = "black")

### 3rd 

plot(sub_data$Sub_metering_1 ~ as.POSIXct(paste(sub_data$Date, sub_data$Time)),type = "l", xlab = "",ylab = "Energy sub metering",col = "black")

lines(sub_data$Sub_metering_2 ~ as.POSIXct(paste(sub_data$Date, sub_data$Time)), col = "red")

lines(sub_data$Sub_metering_3 ~ as.POSIXct(paste(sub_data$Date, sub_data$Time)),col = "blue")

legend("topright",legend = c("Sub_metering_1","sub_metering_2","sub_metering_3"),col = c("black","red","blue"),lty = 1)

### 4th 
plot(sub_data$Global_reactive_power ~ as.POSIXct(paste(sub_data$Date, sub_data$Time)),type = "l", xlab = "datetime",ylab = "Global_reactive_power",col = "black")

dev.off()



