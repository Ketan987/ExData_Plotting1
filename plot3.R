library(lubridate)

df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?" ,stringsAsFactors = TRUE)
data <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

datetime <- paste(as.Date(data$Date, format = "%d/%m/%Y"), data$Time)
data$datetime <- as.POSIXct(datetime)

png("plot3.png", width = 480, height = 480, units = "px")
with(data, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "", col = "black"))

lines(data$datetime, data$Sub_metering_2, col = "red")

lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()