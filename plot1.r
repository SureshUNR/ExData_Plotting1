

DATA_FULL <- read.csv("household_power_consumption.txt", 
			sep=";", 
			header=TRUE,
			stringsAsFactors=FALSE,
			na.strings="?")




DATA_FULL$Date <- as.Date(DATA_FULL$Date, format = "%d/%m/%Y")
DATA_FULL$Global_active_power <- as.numeric(DATA_FULL$Global_active_power)

DATA_SUBSET <- DATA_FULL[DATA_FULL$Date >= as.Date("2007-02-01") 
				& DATA_FULL$Date <= as.Date("2007-02-02"),]

png("plot1.png",width=480,height=480)

hist(DATA_SUBSET$Global_active_power,
xlab="Global Active Power (kilowatts)", 
main="Global Active Power",
col="red")

dev.off()
