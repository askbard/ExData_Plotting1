
file <- read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
file$Date <- as.Date(file$Date, "%d/%m/%Y")
file <- subset(file,file$Date >= as.Date("2007-02-01") & file$Date <= as.Date("2007-02-02"))
file <- na.omit(file)


png("plot1.png",width = 480, height = 480)
hist(file$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()