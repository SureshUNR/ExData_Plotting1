
#Step 1: Import the entire data.
DATA_FULL <- read.csv("household_power_consumption.txt", 
			sep=";", 
			header=TRUE,
			stringsAsFactors=FALSE,
			na.strings="?")



#Step 2: Change Date fields to Date format.
DATA_FULL$Date <- as.Date(DATA_FULL$Date, format = "%d/%m/%Y")

#Step 3: Change Global_active_power field to numeric field.
DATA_FULL$Global_active_power <- as.numeric(DATA_FULL$Global_active_power)

#Step 4: Take a subset of data that is required for plotting the histogram.
DATA_SUBSET <- DATA_FULL[DATA_FULL$Date >= as.Date("2007-02-01") 
				& DATA_FULL$Date <= as.Date("2007-02-02"),]

#Step 5: Plot the Histogram.

png("plot1.png",width=480,height=480)
hist(DATA_SUBSET$Global_active_power,
xlab="Global Active Power (kilowatts)", 
main="Global Active Power",
col="red")
dev.off()
