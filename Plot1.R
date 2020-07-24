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

#Histogram plot as plot 1
hist(as.numeric(power1$Global_active_power), col = "red", xlab = "Global Active 
     Power", main = "Global Active Power")

#Converting into png file
dev.copy(png, file = "plot1.png")
dev.off()