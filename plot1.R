## Get data
data_origin <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_origin$Date <- as.Date(data_origin$Date, format="%d/%m/%Y")

## clean data
data <- subset(data_origin, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_origin)

## Convert data
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot
par(mfrow=c(1,1),pty="s",bg="white")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()