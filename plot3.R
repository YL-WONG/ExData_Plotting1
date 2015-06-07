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
with(datasub, 
     {
        plot(Sub_metering_1 ~ Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()