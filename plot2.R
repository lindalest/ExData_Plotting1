library(dplyr)
library(lubridate)
data <- read.csv("household_power_consumption.txt", header = T,
                 sep =";", stringsAsFactors = F, na.strings= "?", dec=".")
glimpse(data)
spec_data<-filter(data, Date == "1/2/2007" | Date == "2/2/2007")
spec_data$ssd_date <- paste(spec_data$Date, spec_data$Time, sep=" ")
spec_data$ss_data <- strptime(spec_data$ssd_date, "%d/%m/%Y %H:%M:%S")                   
                                        

png(filename="plot2.png", width=480, height=480)
plot(spec_data$ss_data, spec_data$Global_active_power,
     xlab=" ", ylab="Global Active Power (kilowatts)", type="l")
dev.off()





