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

# Plot data, using dev.copy
plot(df$Global_active_power ~ df$Datetime, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()