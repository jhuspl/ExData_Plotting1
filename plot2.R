require("data.table")

data = fread("household_power_consumption.txt",
             sep=";",
             header=TRUE,
             na.strings="?",
             stringsAsFactors=FALSE,
             colClasses="character"
)

data = subset(data,Date == "2/2/2007" | Date == "1/2/2007" )

#data$Date = as.Date(data$Date,"%d/%m/%Y")

x = paste(data$Date,data$Time)
y = strptime(x,"%d/%m/%Y %H:%M:%S")

png('plot2.png')

plot(y,as.numeric(data$Global_active_power),type="l",ylab ="Global Active Power (kilowatts)",xlab = "")
dev.off()
