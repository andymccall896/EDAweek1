#### 1st plot

library(dplyr)
data <- read.delim("C:/repo/Exploratory Data Analysis/household_power_consumption.txt",sep = ";")
glimpse(data)

head(data$Date,6)

head(as.Date(data$Date,"%d/%m/%Y"),6)

data$Date <- as.Date(data$Date,"%d/%m/%Y")

class(data$Global_active_power)

data$Global_active_power <- as.character(data$Global_active_power)

data$Global_active_power <- as.numeric(data$Global_active_power)

sub_data<- subset(data,Date == "2007/02/01" | Date == "2007/02/02")


####as.POSIXct(paste(sub_data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png("1stplot.png", width = 350, height = "350")

with(sub_data,hist(Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power",breaks = 12,ylim = c(0,1201)))

dev.off()
