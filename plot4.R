# Load the data file
data_file <- "household_power_consumption.txt"

# Read the data (it’s a text file with ; as the separator)
data <- read.table(data_file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# Convert the Date column to Date type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Keep only the two days we care about
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Combine Date and Time into one "datetime" column
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time),
                                 format="%Y-%m-%d %H:%M:%S")

# Reuse the same subset_data steps

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(subset_data$Datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(subset_data$Datetime, subset_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(subset_data$Datetime, subset_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col="red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col="blue")
legend("topright", bty="n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
plot(subset_data$Datetime, subset_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")
dev.off()
