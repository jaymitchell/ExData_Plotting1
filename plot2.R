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

png("plot2.png", width=480, height=480, units="px")
plot(datetime, data_to_plot$Global_active_power,
     ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()