# my personal working directory !! will not work on your computer !!
setwd("c:/users/rene/desktop/exdata")

Sys.setlocale("LC_ALL", "English")

# file already zipped with Winrar in the above mentioned workingdirectory
# please change to your own working directory if you want to run the code
mydf <-read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE, 
                  na.strings = "?", 
                  stringsAsFactors = FALSE)

# as stated in project 1 only two dates : 
mydf <- mydf[mydf$Date == "1/2/2007"| mydf$Date == "2/2/2007",]
mydf$DateTime <- paste(mydf$Date, mydf$Time)
mydf$DateTime <- as.POSIXct(mydf$DateTime, format  = "%d/%m/%Y %H:%M:%S")

mydev = dev.cur() # just to be sure
png(file = "plot2.png", width = 480, height = 480)   # to get the same png look as the screendevice look

plot(mydf$DateTime, mydf$Global_active_power,
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     type = "l" )

dev.off()
dev.set(mydev)
