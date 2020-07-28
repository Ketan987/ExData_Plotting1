library(lubridate)

df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?" ,stringsAsFactors = TRUE)
data <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

datetime <- paste(as.Date(data$Date, format = "%d/%m/%Y"), data$Time)
data$datetime <- as.POSIXct(datetime)
png("plot2.png", width = 480, height = 480, units = "px")
with(data, plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts"))
dev.off()
