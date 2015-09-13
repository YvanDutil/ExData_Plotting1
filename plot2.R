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


## Plot 2

plot(data_period$Global_active_power ~ data_period$High_tempo, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Saving plot in a PNG file 480x480 pixels2

dev.copy(device = png,filename="plot2.png",width = 480, height = 480);
dev.off ();
