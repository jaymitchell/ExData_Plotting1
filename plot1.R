# This file assumes the Electric power consumption data has been saved in a
# data/ directory relative to this script/working directory.

# Read data
filename <- "data/household_power_consumption.txt"
all_data <- read.csv(filename, header=TRUE, sep=";", na.strings="?")

data_as_date = as.Date(all_data$Date, format="%d/%m/%Y")
data_to_plot <- subset(all_data, data_as_date==as.Date("2007-02-01") |
                                 data_as_date==as.Date("2007-02-02"))

# Plot data

png("plot1.png", width=480, height=480, units="px")
hist(data_to_plot$Global_active_power, main="Global Active Power", col="Red",
     xlab="Global Active Power (kilowatts)")
