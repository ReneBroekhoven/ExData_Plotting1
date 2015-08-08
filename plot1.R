# my personal working directory !! will not work on your computer !!
setwd("c:/users/rene/desktop/exdata")

Sys.setlocale("LC_ALL", "English")


# file already zipped with Winrar in the above mentioned workingdirectory
# please change to yout own working directory if you want to run the code
mydf <-read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE, 
                  na.strings = "?", 
                  stringsAsFactors = FALSE)

mydf$Date <- as.Date(mydf$Date, format = "%d/%m/%Y")
mydf$Time <- as.POSIXct(mydf$Time, format = "%H:%M:%S")
mydf <- subset(mydf, Date == as.Date("2007-02-01")| Date == as.Date("2007-02-02"))  # subsetting for two days

mydev = dev.cur()  # just to be sure
png(file = "plot1.png", width = 480, height = 480)   # to get the same png look as the screendevice look

# plot 1
hist(mydf$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power")

dev.off()
dev.set(mydev)
