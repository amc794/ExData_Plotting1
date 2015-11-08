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
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(2,2,2,0))
with(DT, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})
dev.off()

