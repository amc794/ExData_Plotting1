##Read household data into R
file = "~/data/household_power_consumption.txt"
readLines(file, n=7)
household <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

##Extract readings from the first two days in February
DT <- household[household$Date %in% c("1/2/2007","2/2/2007"),]
str(DT)

##Remove householf from memory
rm(household)

##Plot 1: Distribution of global active power
png("plot1.png", width=480, height=480)
hist(DT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
