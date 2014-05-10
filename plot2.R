url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./temp.zip", method = "curl")
data <- read.table(unz("./temp.zip","household_power_consumption.txt"),head = TRUE, na.string = "?",sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data2 <- data[data$Date > "2007-01-31" & data$Date < "2007-02-03",]
rm(data)
data2$Date <- strptime(paste(data2$Date,data2$Time),format = "%Y-%m-%d %X")
data2$Time <- NULL
par(mfrow = c(1,1))
#PLot #2 
png(file = "plot2.png", width = 480,height = 480)
with(data2, plot(Date,Global_active_power,type = "l", xlab = "", ylab = "Global active power (kilowatts)"))
dev.off()