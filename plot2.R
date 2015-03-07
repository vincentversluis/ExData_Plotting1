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
png(filename = "plot2.png", 
	width = 480, 
	height = 480, 
	units = "px", 
	bg = "white")

# Plot desired plot with lines
plot(df$Time, df$Global_active_power, 
	type = "l",
	main = "",
	xlab = "",
	ylab = "Global Active Power (kilowatts)")

dev.off()
# Done