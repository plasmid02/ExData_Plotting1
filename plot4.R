url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./temp.zip", method = "curl")
data <- read.table(unz("./temp.zip","household_power_consumption.txt"),head = TRUE, na.string = "?",sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data2 <- data[data$Date > "2007-01-31" & data$Date < "2007-02-03",]
rm(data)
data2$Date <- strptime(paste(data2$Date,data2$Time),format = "%Y-%m-%d %X")
data2$Time <- NULL

#PLot #4
png(file = "plot4.png", width = 480,height = 480)
par(mfrow = c(2,2))
#4.1
with(data2, plot(Date,Global_active_power,type = "l", xlab = "", ylab = "Global active power (kilowatts)"))
#4.2
with(data2, plot(Date,Voltage,type = "l", xlab = "datetime", ylab = "Voltage "))
#4.3
with(data2, plot(Date,Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering"))
lines(data2$Date, data2$Sub_metering_2, type = "l",col = "red")
lines(data2$Date, data2$Sub_metering_3, type = "l",col = "blue")
legend("topright", border =  FALSE ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","blue","red"))
#4.4
with(data2, plot(Date,Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()