data <- read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE);
data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S");
data$Date <- as.Date(data$Date, format="%d/%m/%Y");
twodaysset <- data[which(data$Date == '2007-02-01' | data$Date == '2007-02-02'),];
png(filename = "plot1.png", width = 480, height = 480, units = "px");
hist(twodaysset$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)");
dev.off();