data <-read.table("household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- strptime(data$Date,"%d/%m/%Y")
newdata <- data[((data$Date == as.POSIXlt("2007-02-01")) | (data$Date == as.POSIXlt("2007-02-02"))),]
newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))
png(filename="plot1.png",width=480,height=480)
with(newdata,hist(newdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency"))
dev.off()