# Read data
df <- read.table("household_power_consumption.txt", 
	header = TRUE, 
	sep = ";",
	colClasses = c("character", "character", rep("numeric", 7)),
	na.strings = "?")

# Convert date from dd/mm/yyyy to yyyy-mm-dd
df[,1] <- as.Date(df[,1], "%d/%m/%Y")

# Extract data from 2007-02-01 to 2007-02-02
df <- df[c(66637:69517),]

# Create a file to dump the plot in
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

# Plot desired histogramme
hist(df$Global_active_power,
	main = "Global Active Power",
	xlab = "Global Active Power (kilowatts)",
	ylab = "Frequency",
	col = "red")

dev.off()
# Done