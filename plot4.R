require("data.table")

data = fread("household_power_consumption.txt",
             sep=";",
             header=TRUE,
             na.strings="?",
             stringsAsFactors=FALSE,
             colClasses="character"
)

#subset the data

data = subset(data,Date == "2/2/2007" | Date == "1/2/2007" )

# datetime variable created
x = paste(data$Date,data$Time)
y = strptime(x,"%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)
data$Voltage = as.numeric(data$Voltage)
data$Global_reactive_power = as.numeric(data$Global_reactive_power)

png('plot4.png')

#par(mfrow = c(1,1), mar = c(5,4,3,3))
par(mfrow = c(2,2), mar = c(5,4,3,3))

# First plot
plot(y,as.numeric(data$Global_active_power),type="l",ylab ="Global Active Power",xlab = "")

# Second Plot

plot(y,data$Voltage,type="l",ylab ="Voltage",xlab = "datetime")

# Third Plot

plot(y,data$Sub_metering_1,type="l",ylab ="Energy sub metering",xlab = "",col="black")
lines(y,data$Sub_metering_2,type="l",col="red")
lines(y,data$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1,bty="n")

# Fourth Plot

plot(y,data$Global_reactive_power,type="l",ylab ="Global_reactive_power",xlab = "datetime")

dev.off()
