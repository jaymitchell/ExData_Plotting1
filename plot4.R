# This file assumes the Electric power consumption data has been saved in a
# data/ directory relative to this script/working directory.

# Read data
filename <- "data/household_power_consumption.txt"
all_data <- read.csv(filename, header=TRUE, sep=";", na.strings="?")

data_as_date = as.Date(all_data$Date, format="%d/%m/%Y")
data_to_plot <- subset(all_data, data_as_date==as.Date("2007-02-01") |
                               data_as_date==as.Date("2007-02-02"))

# Create datetime to plot
datetime <- paste(data_to_plot$Date, data_to_plot$Time, sep = ' ')
datetime <- strptime(datetime, format = '%d/%m/%Y %H:%M:%S')

# Plot data
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2, 2))

# Global active power plot
plot(datetime, data_to_plot$Global_active_power,
     ylab="Global Active Power", xlab="", type="l")

# Voltage plot
plot(datetime, data_to_plot$Voltage, ylab="Voltage", type="l")

# Energy sub metering plot
plot(datetime, data_to_plot$Sub_metering_1,
     ylab="Energy sub metering", xlab="",
     type="n")
lines(data_to_plot$Sub_metering_1, x=datetime, col="black")
lines(data_to_plot$Sub_metering_2, x=datetime, col="red")
lines(data_to_plot$Sub_metering_3, x=datetime, col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=c(1,1,1), bty="n")

# Global reactive power plot
plot(datetime, data_to_plot$Global_reactive_power, ylab="Global_reactive_power",
     type="l")

dev.off()