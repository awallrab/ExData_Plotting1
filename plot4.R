## plot4.R

# change to working directory
old_wd <- getwd()
setwd("/talend/R/04_Exploratory/Assignment1")

# read data set (will take some time)
data <- read.csv("data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", comment.char="", check.names=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# only date 2007-02-01 and 2007-02-02
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert the dates to POSIXct
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# create plot
# set graph parameters
par(mfrow=c(2, 2), mar=c(4, 4, 4, 2))

# global active power
plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power")

# voltage
plot(data$Voltage~data$Datetime, type="l", xlab="datetime", ylab="Voltage")

# # energy sub metering
plot(data$Sub_metering_1~data$Datetime, type="l", col="black", xlab="", ylab="Energy sub metering")
points(data$Sub_metering_2~data$Datetime, type="l", col="red")
points(data$Sub_metering_3~data$Datetime, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=.5, bty="n")

## reactive power
plot(data$Global_reactive_power~data$Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")

# save "plot4.png"
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

# get back to original directory
setwd(old_wd)