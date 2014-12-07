require("data.table")

data = fread("household_power_consumption.txt",
             sep=";",
             header=TRUE,
             na.strings="?",
             stringsAsFactors=FALSE,
             colClasses="character"
)

data = subset(data,Date == "2/2/2007" | Date == "1/2/2007" )

png('plot1.png')
hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()
