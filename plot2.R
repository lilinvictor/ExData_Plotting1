# Read data from ZIP file
unzip(zipfile = "exdata_data_household_power_consumption.zip", exdir = "data", overwrite = TRUE)
data <- read.csv("data/household_power_consumption.txt", sep = ";", na.string = "?")

# Filter data by specified date range
data$MyDate <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$MyDate >= as.Date("2007-02-01") & data$MyDate <= as.Date("2007-02-02"),]

# Combine date and time
data$MyTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Draw plot in PNG file
png(file = "plot2.png", width = 480, height = 480)
plot(data$MyTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
