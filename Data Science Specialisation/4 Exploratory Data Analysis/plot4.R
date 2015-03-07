# Read data
df <- read.table("household_power_consumption.txt", 
	header = TRUE, 
	sep = ";",
	colClasses = c("character", "character", rep("numeric", 7)),
	na.strings = "?")

# Extract data from 2007-02-01 to 2007-02-02
df <- df[c(66637:69517),]

# Change date and time into a useful format
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Create a file to dump the plot in
png(filename = "plot4.png", 
	width = 480, 
	height = 480, 
	units = "px", 
	bg = "white")

# Plot desired plots with lines and such
par(mfrow=c(2,2))

# Left top one
plot(df$Time, df$Global_active_power, 
	type = "l",
	main = "",
	xlab = "",
	ylab = "Global Active Power (kilowatts)")

# Right top one
plot(df$Time, df$Voltage,
	type = "l",
	main = "",
	xlab = "datetime",
	ylab = "Voltage")

# Left bottom one
plot(df$Time, df$Sub_metering_1, 
	type = "l", 
	col = "black",
	xlab = "",
	ylab = "Energy sub metering")
lines(df$Time, df$Sub_metering_2, 
	col = "red")
lines(df$Time, df$Sub_metering_3, 
	col = "blue")
legend("topright",
	col = c("black", "red", "blue"),
	c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lwd = 1)

# Right bottom one
plot(df$Time, df$Global_reactive_power,
	type = "l",
	xlab = "datetime",
	ylab = "Global_reactive_power")

dev.off()
# Done