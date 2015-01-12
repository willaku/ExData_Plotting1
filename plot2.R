# Plot 2
# Read file
data <- read.csv(file="household_power_consumption.txt", head=TRUE, sep=";", stringsAsFactors=FALSE)

# Get Subset for specified dates
plot_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Clean up and prep data
plot_data$DateTime <- strptime(paste(plot_data$Date, plot_data$Time), "%d/%m/%Y %H:%M:%S")
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

# Create the chart
png(file = "plot2.png")

plot(plot_data$DateTime, plot_data$Global_active_power, type="l"
     ,xlab="", ylab="Global Active Power (kilowatts)")
dev.off()