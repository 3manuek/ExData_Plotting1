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

par(mfrow = c(2,2) , mar=c(4,4,2,1), oma=c(0,0,2,0))

with(df, {
  plot(Global_active_power~Datetime, xlab = "" , ylab = "Global Active Power", type = "l")
  plot(Voltage~Datetime, ylab = "Voltage", type = "l")
  plot(Datetime , Sub_metering_1, col = "black", type = "l",
       xlab = "", ylab = "Energy sub metering"
  )
  lines( Sub_metering_2~Datetime, col = "red" , type = "l")
  lines( Sub_metering_3~Datetime, col = "blue" , type = "l")
  legend("topright",col = c("black","red","blue"), lty=1, lwd=2,bty="n",
         cex = 0.60,
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type = "l",
       ylab = "Global Reactive Power")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

