df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = TRUE)
data <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

GlobalActivePower <-  as.numeric(data$Global_active_power)
png("plot1.png", width = 480, height = 480, units = "px")

hist(GlobalActivePower, col ="red", main = "Global Active Power",xlab = "Global Active Power (Kilowatts)")
dev.off()