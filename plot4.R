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

## Plot 4
png(file="plot4.png")
par(mfrow = c(2, 2))

### Plot 4.1
plot(Base$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt = "n",xlab="")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
### /Plot 4.1

### Plot 4.2
plot(Base$Voltage,type="l",ylab="Voltage",xaxt = "n",xlab="datetime")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
### Plot /4.2

### Plot 4.3
plot(Base$Sub_metering_1,type="l",ylab="Energie sub metering",xaxt = "n",xlab="")
lines(Base$Sub_metering_2,col="red")
lines(Base$Sub_metering_3,col="blue")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright", lty=c(1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
### Plot /4.3

### Plot 4.4
plot(Base$Global_reactive_power,type="l",ylab="Global_reactive_power",xaxt = "n",xlab="datetime")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
### Plot /4.4

dev.off()
### /Plot 4