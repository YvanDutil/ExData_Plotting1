
## Getting data

data <- read.csv("household_power_consumption.txt", header = T, sep = ';',  na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Selecting the data within the time frame
data_period <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
High_tempo <- paste(as.Date(data_period$Date), data_period$Time)
data_period$High_tempo <- as.POSIXct(High_tempo)

#Additional code for those who are not normmaly working in english
#Setting the system to have the weekday in English
Sys.setlocale("LC_TIME", "English")


## Generating Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data_period, {
  plot(Global_active_power ~ High_tempo, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ High_tempo, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ High_tempo, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ High_tempo, col = 'Red')
  lines(Sub_metering_3 ~ High_tempo, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ High_tempo, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})


#Saving plot in a PNG file 480x480 pixels2

dev.copy(device = png,filename="plot4.png",width = 480, height = 480);
dev.off ();