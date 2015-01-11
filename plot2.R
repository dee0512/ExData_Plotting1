data <-read.table("household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- strptime(data$Date,"%d/%m/%Y")
newdata <- data[((data$Date == as.POSIXlt("2007-02-01")) | (data$Date == as.POSIXlt("2007-02-02"))),]
newdata$new_time <- paste(newdata$Date,newdata$Time,sep=" ")
newdata$new_time <- strptime(newdata$new_time,"%Y-%m-%d %H:%M:%S")
newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))
png(filename="plot2.png",width=480,height=480)
with(newdata,plot(newdata$new_time,newdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()