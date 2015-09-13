
# Getting data

Power_data <- file("household_power_consumption.txt")
Power <- read.table(text = grep("^[1,2]/2/2007", readLines(Power_data), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
close(Power_data)

# Plot 1
hist(Power$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", ylim=c(0,1200) )

#Saving plot in a PNG file 480x480 pixels2

dev.copy(device = png,filename="plot1.png",width = 480, height = 480);
dev.off ();
