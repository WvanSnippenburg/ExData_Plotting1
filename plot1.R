d <- read.csv("data.txt", sep = ";")
d <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

d$Date <- as.POSIXlt(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")
d$Time <- NULL # Remove column since time is now also stored in Date column

d[2:8] <- apply(d[2:8], 2, as.numeric) # Convert Watt and voltage from factors

png("plot1.png", width = 480, height = 480)

hist(d$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()