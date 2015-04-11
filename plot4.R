library(dplyr)
library(lubridate)
data <- read.csv("household_power_consumption.txt", header = T,
                 sep =";", stringsAsFactors = F, na.strings= "?", dec=".")
glimpse(data)
spec_data<-filter(data, Date == "1/2/2007" | Date == "2/2/2007")
spec_data$ssd_date <- paste(spec_data$Date, spec_data$Time, sep=" ")
spec_data$ss_data <- strptime(spec_data$ssd_date, "%d/%m/%Y %H:%M:%S") 
glimpse(spec_data)
png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
    plot(spec_data$ss_data, spec_data$Global_active_power,
         xlab=" ", ylab="Global Active Power",
         type="l")
    plot(spec_data$ss_data, spec_data$Voltage, type = "l", 
         ylab = "Voltage", xlab= "datetime")
    
plot(spec_data$ss_data, spec_data$Sub_metering_1, type ="l", 
     ylab= "Energy sub metering", xlab=" ")
lines(spec_data$ss_data, spec_data$Sub_metering_2, col = "red")
lines(spec_data$ss_data, spec_data$Sub_metering_3, col = "blue")
legend ("topright", lty=1, col = c("black", "red", "blue"), 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="n")
    plot(spec_data$ss_data, spec_data$Global_reactive_power,
         type="l", xlab="datetime", ylab="Global_reactive_power")                                                          

dev.off()




