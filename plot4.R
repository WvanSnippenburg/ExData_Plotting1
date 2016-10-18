d <- read.csv("data.txt", sep = ";")
d <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

d$Date <- as.POSIXlt(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")
d$Time <- NULL # Remove column since time is now also stored in Date column

d[2:8] <- apply(d[2:8], 2, as.numeric) # Convert Watt and voltage from factors

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(d$Date, d$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(d$Date, d$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(d$Date, d$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(d$Date, d$Sub_metering_2, col = "red")
lines(d$Date, d$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

plot(d$Date, d$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()