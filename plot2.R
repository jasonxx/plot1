## Get data
data_origin <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_origin$Date <- as.Date(data_origin$Date, format="%d/%m/%Y")

## Cleaning data
data <- subset(data_origin, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_origin)

## Converting data
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot
par(mfrow=c(1,1),pty="s",bg="white")
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()