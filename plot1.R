
# Load the data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# Transform as a data.frame
POWER <- as.data.frame.matrix(power)

# Convert the date into a "Date" class
POWER$Date <- as.Date(POWER$Date,format="%d/%m/%Y")

# Convert the date and time into a "DateTime" column
POWER$DateTime <- as.POSIXct(paste(POWER$Date, POWER$Time), format="%Y-%m-%d %H:%M:%S")

# Filter NA and date
POWER2 <- subset(POWER, (!is.na(Date) & !is.na(Time) &
                           !is.na(Global_active_power) &
                           !is.na(Global_reactive_power) &
                           !is.na(Voltage) &
                           !is.na(Global_intensity) &
                           !is.na(Sub_metering_1) &
                           !is.na(Sub_metering_2) &
                           !is.na(Sub_metering_3)) &
                           (Date == as.Date("2007-02-01") |
                            Date == as.Date("2007-02-02") ) )

# Do we have any data left?
dim(POWER2)

# Prepare png
png("plot1.png", width = 480, height = 480)

# Plot parameters
par(ps=12)

# Plot
hist(POWER2$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col=c("red"))

# Generate png
dev.off()

