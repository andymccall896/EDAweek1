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


plot(sub_data$Global_active_power~as.POSIXct(paste(sub_data$Date, sub_data$Time), format="%Y-%m-%d %H:%M:%S"),type = "l", xlab = "",ylab = "GLobal Active Power (kilowatts)")

