#open file
household_power_consumption <- read.table(file = "C:\\Users\\maxpoz\\Downloads\\household_power_consumption.txt", sep = ";", header = TRUE)

household_power_consumption <- subset(household_power_consumption, Date == '1/2/2007' | Date == '2/2/2007')

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format = "%m/%d/%Y")


household_power_consumption$Sub_metering_1<-as.numeric(as.character(household_power_consumption$Sub_metering_1))
household_power_consumption$Sub_metering_2<-as.numeric(as.character(household_power_consumption$Sub_metering_2))
household_power_consumption$Sub_metering_3<-as.numeric(as.character(household_power_consumption$Sub_metering_3))

png(filename="C:\\Users\\maxpoz\\Downloads\\plot4.png")

household_power_consumption$Time<-as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%Y-%m-%d %H:%M:%S")
household_power_consumption$Time<-strptime(household_power_consumption$Time,format="%Y-%d-%m %H:%M:%S")
household_power_consumption$Global_active_power<-as.numeric(as.character(household_power_consumption$Global_active_power))
household_power_consumption$Voltage<-as.numeric(as.character(household_power_consumption$Voltage))
household_power_consumption$Global_reactive_power<-as.numeric(as.character(household_power_consumption$Global_reactive_power))



# 4 figures arranged in 2 rows and 2 columns
par(mfrow=c(2,2))
############
plot(household_power_consumption$Time,household_power_consumption$Global_active_power, type="l",ylab = "Global Active Power kilowatts",xlab = ' ')
###########
plot(household_power_consumption$Time,household_power_consumption$Voltage, type="l",xlab = "daytime",ylab = 'Voltage')
###########
plot(household_power_consumption$Time,household_power_consumption$Sub_metering_3, type="l",ylab = "Energy sub metering",xlab = ' ', col="blue",ylim=c(0,39),yaxt="n")
axis(2, at=seq(0, 30, by=10), labels = TRUE)
lines(household_power_consumption$Time,household_power_consumption$Sub_metering_2,col="red")
lines(household_power_consumption$Time,household_power_consumption$Sub_metering_1,col="black")
# Add a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty=1, cex=0.8)
#############
plot(household_power_consumption$Time,household_power_consumption$Global_reactive_power, type="l",ylab = "Global_reactive_power",xlab = ' ')



dev.off()