require("data.table")

data = fread("household_power_consumption.txt",
             sep=";",
             header=TRUE,
             na.strings="?",
             stringsAsFactors=FALSE,
             colClasses="character"
)

data = subset(data,Date == "2/2/2007" | Date == "1/2/2007" )


x = paste(data$Date,data$Time)
y = strptime(x,"%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

png('plot3.png')

plot(y,data$Sub_metering_1,type="l",ylab ="Energy sub metering",xlab = "",col="black")
lines(y,data$Sub_metering_2,type="l",col="red")
lines(y,data$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1)

dev.off()
