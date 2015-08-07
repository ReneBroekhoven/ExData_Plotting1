## !!!!!!!!!!!!!!!   To my peer reviewer :  !!!!!!!!!!!!!!!
## The x-axis tics are in the Dutch language.
## I did not think that it was necessary for the assignment to chagne these to english
## hope you agree !

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
mydf$DateTime <- as.POSIXct(mydf$DateTime, format  = "%d/%m/%Y %H:%M:%S")

mydev = dev.cur()
png(file = "plot2.png", width = 480, height = 480)   # to get the same png look as the screendevice look

plot(mydf$DateTime,mydf$Global_active_power,
     ylab="Global Active Power (kilowatts)", 
     xlab="",
     type="l" )

#dev.copy(png, file="plot2.png") # this dit not correctly copy the screen to the png
dev.off()
dev.set(mydev)
