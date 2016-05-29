
#Step 1: Import the entire data.
DATA_FULL <- read.csv("household_power_consumption.txt", 
			sep=";", 
			header=TRUE,
			stringsAsFactors=FALSE,
			na.strings="?")

#Step 2: Create a DateTime fields which is combination of Date and Time
DATA_FULL$DateTime <- strptime(paste(
			DATA_FULL$Date,DATA_FULL$Time),"%d/%m/%Y %H:%M:%S")

#Step 3: Change Sub_metering.. fields to numeric fields.
DATA_FULL$Sub_metering_1 <- as.numeric(DATA_FULL$Sub_metering_1)
DATA_FULL$Sub_metering_2 <- as.numeric(DATA_FULL$Sub_metering_2)
DATA_FULL$Sub_metering_3 <- as.numeric(DATA_FULL$Sub_metering_3)

#Step 4: Take a subset of data that is required for plotting the graph.
DATE1 <- as.POSIXct("2007-02-01 00:00:00")
DATE2 <- as.POSIXct("2007-02-02 23:59:59")
DATA_SUBSET <- DATA_FULL[DATA_FULL$DateTime  >= DATE1 & 
				DATA_FULL$DateTime  <= DATE2,]

#Step 5: Make the Required Graph
png("plot3.png",width=480,height=480)
plot(DATA_SUBSET$DateTime, DATA_SUBSET$Sub_metering_1,
	type="l",
	ylab="Energy sub metering",
	xlab=NA,col="black")

lines(DATA_SUBSET$DateTime, DATA_SUBSET$Sub_metering_2, col="red")
lines(DATA_SUBSET$DateTime, DATA_SUBSET$Sub_metering_3, col="blue")

legend("topright", 
		lty=1, col = c("black", "red", "blue"), 
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


