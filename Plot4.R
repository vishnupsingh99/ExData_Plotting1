#Read the electric consumption dataset into R
power = read.table("household_power_consumption.txt", sep = ";", 
                   col.names = power[1,], skip = 1)
power1= power
#Convert the date into Date class
power1$Date=dmy(power1$Date)
#Extracting the data only for the first 2-days of February
power1 = power1[66637:69516,]

#Combining the Date and Time column
power1$DT=as.POSIXct(paste(power1$Date, power1$Time), format="%Y-%m-%d %H:%M:%S")

#Four plots displayed as plot 4
par(mfcol = c(2,2), mar = c(4,4,2,1))
#1
plot(power1$DT, power1$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power(kilowatts)")
lines(power1$DT, power1$Global_active_power)
#2
plot(power1$DT, power1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub Metering")
lines(power1$DT, power1$Sub_metering_1)
lines(power1$DT, power1$Sub_metering_2, col = "red")
lines(power1$DT, power1$Sub_metering_3, col = "blue")
legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2",
                                                                       "Sub_metering_3"), cex = 0.85)
#3
plot(power1$DT, power1$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(power1$DT, power1$Voltage)
#4
plot(power1$DT, power1$Global_reactive_power, type = "n", xlab = "", ylab = "global_reactive_power")
lines(power1$DT, power1$Global_reactive_power)

#Converting into png file
dev.copy(png, file = "plot4.png")
dev.off()