## Load all dataset & Convert date to Date class
dataAll <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataAll$Date <- as.Date(dataAll$Date, format="%d/%m/%Y")

## Subsetting the data
datasub <- subset(dataAll, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataAll)

## Converting dates
datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$Datetime <- as.POSIXct(datetime)

## Plot Graphic
plot(datasub$Global_active_power~ datasub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()