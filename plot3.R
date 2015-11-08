## Read household data into R
file = "~/data/household_power_consumption.txt"
household <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

## Extract readings from the first two days in February
DT <- household[household$Date %in% c("1/2/2007","2/2/2007"),]

## Remove householf from memory
rm(household)

## Change date to the appropriate format format
datetime <- paste(as.Date(DT$Date,format="%d/%m/%Y"), DT$Time)
DT$Datetime <- as.POSIXct(datetime)

## Plot the the consumption of power by appliances
png("plot3.png", width=480, height=480)
with(DT, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
       
