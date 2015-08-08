# my personal working directory !! will not work on your computer !!
setwd("c:/users/rene/desktop/exdata")

Sys.setlocale("LC_ALL", "English") # to change from Dutch labels to English

# file already zipped with Winrar in the above mentioned workingdirectory
# please change to yout own working directory if you want to run the code
mydf <-read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE, 
                  na.strings = "?", 
                  stringsAsFactors = FALSE)

mydf <- mydf[mydf$Date == "1/2/2007"| mydf$Date == "2/2/2007",]
mydf$DateTime <- paste(mydf$Date, mydf$Time)

mydf$Date <- as.Date(mydf$Date, format = "%d/%m/%Y")
mydf$Time <- as.POSIXct(mydf$Time, format  = "%H:%M:%S")
mydf$DateTime <- as.POSIXct(mydf$DateTime, format  = "%d/%m/%Y %H:%M:%S")

mydev = dev.cur()
png(file = "plot4.png", width = 480, height = 480)   # to get the same png look as the screendevice look
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

###   plot 1 ###
plot(mydf$DateTime,mydf$Global_active_power,
     ylab = "Global Active Power", 
     xlab = "",
     type = "l")

###   plot2   ###
plot(mydf$DateTime,mydf$Voltage,
     ylab = "Voltage", 
     xlab = "datetime",
     type = "l")

###   plot3   ###
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

legend("topright", legend  = c(names(mydf)[7],names(mydf)[8],names(mydf)[9]), 
       text.col= c(1,2,4),
       col = c(1,2,4),
       lty = 1, 
       bty = "n",
       pch = c(NA, NA, NA) )

###   plot4   ###
plot(mydf$DateTime,mydf$Global_reactive_power,
     ylab = names(mydf)[4], 
     xlab = "datetime",
     type = "l")

dev.off()
dev.set(mydev)



