# my working directory
setwd("c:/users/rene/desktop/exdata")

# file already zipped with Winrar
mydf <-read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE, 
                  na.strings = "?", 
                  stringsAsFactors = FALSE)

# as stated in project 1 only two dates : 
mydf <- mydf[mydf$Date == "1/2/2007"| mydf$Date == "2/2/2007",]
mydf$DateTime <- paste(mydf$Date, mydf$Time)

mydf$Date <- as.Date(mydf$Date, format = "%d/%m/%Y")
mydf$Time <- as.POSIXct(mydf$Time, format  = "%H:%M:%S")
mydf$DateTime <- as.POSIXct(mydf$DateTime, format  = "%d/%m/%Y %H:%M:%S")

mydev = dev.cur()
png(file = "plot3.png", width = 480, height = 480)   # to get the same png look as the screendevice look

plot(mydf$DateTime, mydf$Sub_metering_1,
     ylab = "Energy sub metering ", 
     xlab = "",
     type = "l", 
     ylim = c(0,40))

par(new=TRUE)

plot(mydf$DateTime, mydf$Sub_metering_2,
     ylab = "Energy sub metering ", 
     xlab = "",
     type = "l",
     col = "red", 
     ylim = c(0,40) )

par(new=TRUE)

plot(mydf$DateTime, mydf$Sub_metering_3,
     ylab = "Energy sub metering ", 
     xlab = "",
     type = "l",
     col = "blue",
     ylim = c(0,40))

legend("topright", legend  = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       text.col = c(1,2,4),
       col = c(1,2,4),
       lty = c(1,1,1), 
       pch = c(NA, NA, NA) )

#dev.copy(png, file="plot3.png") # this dit not correctly copy the screen to the png
dev.off()
dev.set(mydev)
