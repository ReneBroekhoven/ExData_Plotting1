# my working directory
setwd("c:/users/rene/desktop/exdata")

# file already zipped with Winrar
mydf <-read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE, 
                  na.strings = "?", 
                  stringsAsFactors = FALSE)



mydf$Date <- as.Date(mydf$Date, format = "%d/%m/%Y")
mydf$Time <- as.POSIXct(mydf$Time, format = "%H:%M:%S")
# as stated in project 1 only two dates : 
mydf <- subset(mydf, Date == as.Date("2007-02-01")| Date == as.Date("2007-02-02"))

mydev = dev.cur()
png(file = "plot1.png", width = 480, height = 480)   # to get the same png look as the screendevice look

# plot 1
hist(mydf$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main="Global Active Power")

#dev.copy(png, file="plot1.png") # this dit not correctly copy the screen to the png
dev.off()
dev.set(mydev)
