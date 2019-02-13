
library(data.table)

#open file

household_power_consumption <- read.table(file = "C:\\Users\\maxpoz\\Downloads\\household_power_consumption.txt", sep = ";", header = TRUE)

household_power_consumption <- subset(household_power_consumption, Date == '1/2/2007' | Date == '2/2/2007')

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format = "%m/%d/%Y")


household_power_consumption$Global_active_power<-as.numeric(as.character(household_power_consumption$Global_active_power))



png(filename="C:\\Users\\maxpoz\\Downloads\\plot2.png")

household_power_consumption$Time<-as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%Y-%m-%d %H:%M:%S")
household_power_consumption$Time<-strptime(household_power_consumption$Time,format="%Y-%d-%m %H:%M:%S")
 plot(household_power_consumption$Time,household_power_consumption$Global_active_power, type="l",ylab = "Global Active Power kilowatts",xlab = ' ')



dev.off()
