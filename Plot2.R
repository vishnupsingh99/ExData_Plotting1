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

#Plot between global active power and Datetime as plot 2
plot(power1$DT, power1$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power(kilowatts)")
lines(power1$DT, power1$Global_active_power)

#Converting into png file
dev.copy(png, file = "plot2.png")
dev.off()