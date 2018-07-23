#plotting exercise from Coursera
#source: https://github.com/rdpeng/ExData_Plotting1


library(readr)
library(dplyr)

#assumes file exists
fname <- "household_power_consumption.txt"
headers <- names(read_csv2(file=fname,n_max = 0))
#take only needed data
data <- read_csv2( file = fname, skip = 66637, n_max = 2880)
names(data) <- headers
#create new column of date and time together
data <- data %>% mutate(Date = as.POSIXct(strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S"))) %>% select(-Time)

#plot 4
par(mfrow=c(2,2))
plot(data$Date, as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")
plot(data$Date, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Date, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering", col = 1)
points(data$Date,data$Sub_metering_2,col = "2", type = "l")
points(data$Date,data$Sub_metering_3,col = "4", type = "l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(1,2,4), lty=1, bty="n")
plot(data$Date, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#export
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()