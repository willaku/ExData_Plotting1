# Plot 3
# Read file
data <- read.csv(file="household_power_consumption.txt", head=TRUE, sep=";", stringsAsFactors=FALSE)

# Get Subset for specified dates
plot_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Clean up and prep data
plot_data$DateTime <- strptime(paste(plot_data$Date, plot_data$Time), "%d/%m/%Y %H:%M:%S")
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

# Create the chart
png(file = "plot3.png")

plot(plot_data$DateTime, plot_data$Sub_metering_1, type="l"
     ,xlab="", ylab="Energy sub metering")
lines(plot_data$DateTime,plot_data$Sub_metering_2, type="l", col="red")
lines(plot_data$DateTime,plot_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col="red")


dev.off()