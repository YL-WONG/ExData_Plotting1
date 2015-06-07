## Load all dataset & Convert date to Date class
dataAll <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataAll$Date <- as.Date(dataAll$Date, format="%d/%m/%Y")

## Subsetting the data
datasub <- subset(dataAll, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataAll)

## Plot Hist
hist(datasub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()