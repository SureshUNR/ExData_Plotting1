



DATA_FULL <- read.csv("household_power_consumption.txt", 
			sep=";", 
			header=TRUE,
			stringsAsFactors=FALSE,
			na.strings="?")


DATA_FULL$DateTime <- strptime(paste(
			DATA_FULL$Date,DATA_FULL$Time),"%d/%m/%Y %H:%M:%S")

DATA_FULL$Sub_metering_1 <- as.numeric(DATA_FULL$Sub_metering_1)
DATA_FULL$Sub_metering_2 <- as.numeric(DATA_FULL$Sub_metering_2)
DATA_FULL$Sub_metering_3 <- as.numeric(DATA_FULL$Sub_metering_3)
DATA_FULL$Global_reactive_power <- as.numeric(DATA_FULL$Global_reactive_power)
DATA_FULL$Voltage <- as.numeric(DATA_FULL$Voltage)



DATE1 <- as.POSIXct("2007-02-01 00:00:00")
DATE2 <- as.POSIXct("2007-02-02 23:59:59")


DATA_SUBSET <- DATA_FULL[DATA_FULL$DateTime  >= DATE1 & 
				DATA_FULL$DateTime  <= DATE2,]






png("plot4.png",width=480,height=480)

par(mfcol=c(2,2))

# plot (1,1)
plot(DATA_SUBSET$DateTime, 
DATA_SUBSET$Global_active_power,
type="l",
ylab="Global Active Power (kilowatts)",xlab=NA)

# plot (2,1)
plot(
	DATA_SUBSET$DateTime, 
	DATA_SUBSET$Sub_metering_1,
	type="l",
	ylab="Energy sub metering",
	xlab=NA,
	col="black")

lines(
	DATA_SUBSET$DateTime, 
	DATA_SUBSET$Sub_metering_2, 
	col="red")

lines(
	DATA_SUBSET$DateTime, 
	DATA_SUBSET$Sub_metering_3, col="blue")
	legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (1,2)

plot(
	DATA_SUBSET$DateTime, 
	DATA_SUBSET$Voltage, 
	type="l", 
	xlab="datetime", 
	ylab="Voltage")

# plot (2, 2)

plot (
	DATA_SUBSET$DateTime, 
	DATA_SUBSET$Global_reactive_power, 
	type="l", 
	xlab="datetime", 
	ylab="Global_reactive_power")

dev.off()

