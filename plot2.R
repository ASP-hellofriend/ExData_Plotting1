rawdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

rawdata_subset_dates <- subset(rawdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(rawdata)

rawdata_conv_subset_dates <- paste(as.Date(rawdata_subset_dates$Date), rawdata_subset_dates$Time)
rawdata_subset_dates$Datetime <- as.POSIXct(rawdata_conv_subset_dates)


plot(rawdata_subset_dates$Global_active_power~rawdata_subset_dates$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()