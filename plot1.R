# change to working directory
old_wd <- getwd()
setwd("/talend/R/04_Exploratory/Assignment1")

# read data set (will take some time)
data <- read.csv("data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", comment.char="", check.names=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# only date 2007-02-01 and 2007-02-02
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## draw histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

## create "plot1.png"
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

# get back to original directory
setwd(old_wd)