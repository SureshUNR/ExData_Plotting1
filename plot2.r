
DATA_FULL <- read.csv("household_power_consumption.txt", 
			sep=";", 
			header=TRUE,
			stringsAsFactors=FALSE,
			na.strings="?")


DATA_FULL$DateTime <- strptime(paste(
			DATA_FULL$Date,DATA_FULL$Time),"%d/%m/%Y %H:%M:%S")

DATA_FULL$Global_active_power <- as.numeric(DATA_FULL$Global_active_power)


DATE1 <- as.POSIXct("2007-02-01 00:00:00")
DATE2 <- as.POSIXct("2007-02-02 23:59:59")


DATA_SUBSET <- DATA_FULL[DATA_FULL$DateTime  >= DATE1 & DATA_FULL$DateTime  <= DATE2,]

png("plot2.png",width=480,height=480)



plot(DATA_SUBSET$DateTime, 
DATA_SUBSET$Global_active_power,type="l",
ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()


