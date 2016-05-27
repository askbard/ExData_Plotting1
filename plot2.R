

file <- read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
file$DT <- paste(file$Date , file$Time,sep = ",")
file <- file[,3:10]
file$DT <- strptime(file$DT, format = "%d/%m/%Y,%H:%M:%S")
file <- subset(file,file$DT >= strptime("2007-02-01",format = "%Y-%m-%d") & file$DT < strptime("2007-02-03",format = "%Y-%m-%d"))
file <- na.omit(file)


png("plot2.png",width = 480, height = 480)
plot(x=file$DT,y = file$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)" , xlab = "")
dev.off()