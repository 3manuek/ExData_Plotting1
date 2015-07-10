# Load data
df <- read.csv("data/household_power_consumption.txt", 
               header = TRUE, 
               #as.is = TRUE,
               sep = ";",
               na.strings = "?", comment.char="", quote='\"',
               colClasses = c("character","character",rep("numeric",7)))
#convert to date using formating 
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

# Subset data and 
df <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

# Plot 3
png("plot3.png", width=480, height=480)
with(df , {
  plot(Datetime , Sub_metering_1, col = "black", type = "l",
       xlab = "", ylab = "Energy sub metering"
       )
  lines( Sub_metering_2~Datetime, col = "red" , type = "l")
  lines( Sub_metering_3~Datetime, col = "blue" , type = "l")
})

legend("topright",col = c("black","red","blue"), lty=1, lwd=2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
