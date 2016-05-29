
#Step 1: Import the entire data.
DATA_FULL <- read.csv("household_power_consumption.txt", 
			sep=";", 
			header=TRUE,
			stringsAsFactors=FALSE,
			na.strings="?")

#Step 2: Create a DateTime fields which is combination of Date and Time
DATA_FULL$DateTime <- strptime(paste(
			DATA_FULL$Date,DATA_FULL$Time),"%d/%m/%Y %H:%M:%S")

#Step 3: Change Global_active_power field to numeric field.
DATA_FULL$Global_active_power <- as.numeric(DATA_FULL$Global_active_power)

#Step 4: Take a subset of data that is required for plotting the graph.
DATE1 <- as.POSIXct("2007-02-01 00:00:00")
DATE2 <- as.POSIXct("2007-02-02 23:59:59")
DATA_SUBSET <- DATA_FULL[DATA_FULL$DateTime  >= DATE1 & 
				DATA_FULL$DateTime  <= DATE2,]

#Step 5: Make the Required Graph
png("plot2.png",width=480,height=480)
plot(DATA_SUBSET$DateTime, 
DATA_SUBSET$Global_active_power,type="l",
ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()
