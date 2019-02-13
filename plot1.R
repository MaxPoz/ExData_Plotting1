

#open file

household_power_consumption <- read.table(file = "C:\\Users\\maxpoz\\Downloads\\household_power_consumption.txt", sep = ";", header = TRUE)

#filter date
household_power_consumption <- subset(household_power_consumption, Date == '1/2/2007' | Date == '2/2/2007')
#convertion date
household_power_consumption$Date<-as.Date(household_power_consumption$Date, format = "%m/%d/%Y")

#convertion numeric the variable
household_power_consumption$Global_active_power<-as.numeric(as.character(household_power_consumption$Global_active_power))

#active the save path
png(filename="C:\\Users\\maxpoz\\Downloads\\plot1.png")

#plot graph

hist(as.numeric(household_power_consumption$Global_active_power), col = "red",main = "Global active power", xlab = "Global Active Power kilowatts",yaxt = 'n')
axis(2, at=seq(0, 1200, by=200), labels = TRUE)

#close device
dev.off()
