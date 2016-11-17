
# download and unzip data
setwd('D:/Dropbox/Data Science Course/4. Exploratory Data Analysis/Course Project 1')

# read data into R
files <- file('./data/household_power_consumption.txt') 
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# convert data and time to specific format
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# plot figure
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l') 

# Saving to a file
dev.copy(png, file='./figures/plot2.png', height=480, width=480, units='px')
dev.off()