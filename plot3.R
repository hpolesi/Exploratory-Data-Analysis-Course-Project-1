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

## Plot 3
png(file="plot3.png")
plot(Base$Sub_metering_1,type="l",ylab="Energie sub metering",xaxt = "n",xlab="")
lines(Base$Sub_metering_2,col="red")
lines(Base$Sub_metering_3,col="blue")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright", lty=c(1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
## /Plot3
