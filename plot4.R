data <- read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE);
data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S");
data$Date <- as.Date(data$Date, format="%d/%m/%Y");
twodaysset <- data[which(data$Date == '2007-02-01' | data$Date == '2007-02-02'),];
png(filename = "plot4.png", width = 480, height = 480, units = "px");
par(mfrow=c(2,2))
with(twodaysset, {
  hist(twodaysset$Global_active_power,col="red", main="", xlab="Global Active Power (kilowatts)");
  plot(Time, Voltage, type="l", xlab="datetime")
  plot(twodaysset$Time, twodaysset$Sub_metering_1, type = "l" , xlab = "", ylab = "Energy sub metering");
  lines(twodaysset$Time, twodaysset$Sub_metering_2, col="red");
  lines(twodaysset$Time, twodaysset$Sub_metering_3, col="blue");
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"));
  plot(Time, Global_reactive_power, type="l", , xlab="datetime")
})
dev.off();