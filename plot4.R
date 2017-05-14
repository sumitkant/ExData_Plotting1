# Read DAta
fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Read between dates
myfunc <- function(x,y){fulldata[as.Date(fulldata$Date, format ="%d/%m/%Y") >= x &as.Date(fulldata$Date, format ="%d/%m/%Y") <= y,]}

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

mydata <- myfunc(DATE1,DATE2)    

# MIssing Values
sapply(mydata, function(x){sum(x == "?")})



#### PLOT 3 #####


png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

## PLOT 1,1
plot(date_continuous, as.numeric(mydata$Global_active_power),type="l", xlab="", ylab="Global Active Power (kilowatts)")

## PLOT 1,2

plot(date_continuous, as.numeric(mydata$Voltage),type="l", xlab="datetime", ylab="Voltage")

# PLOT 2,1
plot(date_continuous, as.numeric(mydata$Sub_metering_1),type="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(date_continuous,as.numeric(mydata$Sub_metering_2), col = "red")
lines(date_continuous,as.numeric(mydata$Sub_metering_3), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


## PLOT 2,2

plot(date_continuous, as.numeric(mydata$Global_reactive_power),type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
