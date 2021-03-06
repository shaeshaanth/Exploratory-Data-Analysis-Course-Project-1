#Datafile path
dataFilePowerConsumption <- "./data/household_power_consumption.txt"
#load data
Graphdata <- read.table(dataFilePowerConsumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Filter Data
subSetData <- data[Graphdata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
#subSet1
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
#subSet2
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
#SubSet3
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()