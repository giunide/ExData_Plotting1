# Load the data
hpc <- read.csv("C:/Users/giuni/Downloads/household_power_consumption.txt",
                col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                sep=";", skip = 66636, nrows =2880, stringsAsFactors = FALSE)

#Assign Dates and Times Formats with Lubridate package
library(lubridate)
hpc$Date <- dmy(hpc$Date)
hpc$Time <- hms(hpc$Time)

#Assign Numeric format to other columns
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$Global_intensity <- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

#Plot 1
hist(hpc$Global_active_power,main="Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

#Saving to PNG file
dev.copy(png, "plot1.png", heigh = 480, width = 480)
dev.off()