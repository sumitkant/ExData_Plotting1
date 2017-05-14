# Read DAta
fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Read between dates
myfunc <- function(x,y){fulldata[as.Date(fulldata$Date, format ="%d/%m/%Y") >= x &as.Date(fulldata$Date, format ="%d/%m/%Y") <= y,]}

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

mydata <- myfunc(DATE1,DATE2)    

# MIssing Values
sapply(mydata, function(x){sum(x == "?")})



#### PLOT 2 #####

date_continuous <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GAP <- as.numeric(mydata$Global_active_power)

png("plot2.png", width=480, height=480)

plot(date_continuous, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
