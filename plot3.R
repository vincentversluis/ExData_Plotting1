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
png(filename = "plot3.png", 
	width = 480, 
	height = 480, 
	units = "px", 
	bg = "white")

# Plot desired plot with lines and such
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
	lty = 1)

dev.off()
# Done