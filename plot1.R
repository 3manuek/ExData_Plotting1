# Load data
df <- read.csv("data/household_power_consumption.txt", 
               header = TRUE, 
               #as.is = TRUE,
               sep = ";",
               na.strings = "?", comment.char="", quote='\"',
               colClasses = c("character","character",rep("numeric",7)))
#convert to date using formating 
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

# Subset data
df <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

# ploting
png("plot1.png", width=480, height=480)

hist(df$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
