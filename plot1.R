

# Convert the Date column to Date type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Keep only the two days we care about
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Combine Date and Time into one "datetime" column
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time),
                                 format="%Y-%m-%d %H:%M:%S")

# Create Plot 1: a histogram
png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()



