
file <- read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
file$DT <- paste(file$Date , file$Time,sep = ",")
file <- file[,3:10]
file$DT <- strptime(file$DT, format = "%d/%m/%Y,%H:%M:%S")
file <- subset(file,file$DT >= strptime("2007-02-01",format = "%Y-%m-%d") & file$DT < strptime("2007-02-03",format = "%Y-%m-%d"))
file <- na.omit(file)

png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

plot(x=file$DT,y = file$Global_active_power,type="l",ylab = "Global Active Power" , xlab = "")

plot(x=file$DT,y = file$Voltage,type="l",ylab = "Voltage" , xlab = "datetime")

plot(x=file$DT,y = file$Sub_metering_1,type="l",ylab = "Energy sub metering" , xlab = "")
lines(x=file$DT,y = file$Sub_metering_2, col="Red")
lines(x=file$DT,y = file$Sub_metering_3, col="Blue")
legend("topright",bty = "n",lty=1,col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(x=file$DT,y = file$Global_reactive_power,type="l",ylab = "Global_reactive_power" , xlab = "datetime")

dev.off()