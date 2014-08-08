## Data download & Base production

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
household_power_consumption <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
unlink(temp)

household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
Base<-household_power_consumption[(household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02"),]
rm(household_power_consumption)
rm(temp)

## /Data download & Base production


## Plot 1
png(file="plot1.png")
hist(Base$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
## /Plot 1
