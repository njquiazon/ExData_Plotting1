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

#plot 2
plot(data$Date, as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#export
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()