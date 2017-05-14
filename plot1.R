# Read DAta
fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Read between dates
myfunc <- function(x,y){fulldata[as.Date(fulldata$Date, format ="%d/%m/%Y") >= x &as.Date(fulldata$Date, format ="%d/%m/%Y") <= y,]}

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

mydata <- myfunc(DATE1,DATE2)    

# MIssing Values
sapply(mydata, function(x){sum(x == "?")})



#### PLOT 1 #####
png("plot1.png", width=480, height=480)

hist(as.numeric(mydata$Global_active_power), col = "red",
     cex = 1.5,
     xlab ="Global Active Power (Kilowatts)",
     ylab = "Frequency",
     main = "Global Active power")

dev.off()
