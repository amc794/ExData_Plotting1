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

## Plot the daily fluctions of the Global active power
png("plot2.png", width=480, height=480)
plot(DT$Datetime,DT$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()



