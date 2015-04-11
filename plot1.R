library(dplyr)
library(lubridate)
data <- read.csv("household_power_consumption.txt", header = T,
                 sep =";", stringsAsFactors = F, na.strings= "?", dec=".")
glimpse(data)
spec_data<-filter(data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename="plot1.png", width=480, height=480)
hist(spec_data$Global_active_power, col = "red",
     main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()




