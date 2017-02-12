##Read data from .txt file
HPCdata <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# 1.Date: Date in format dd/mm/yyyy
# 2.Time: time in format hh:mm:ss
# 3.Global_active_power: household global minute-averaged active power (in kilowatt)
# 4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# 5.Voltage: minute-averaged voltage (in volt)
# 6.Global_intensity: household global minute-averaged current intensity (in ampere)
# 7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# 8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# 9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

head(HPCdata)
HPCdata2 <- HPCdata

#Combine Date Time Columns
HPCdata2$Date <- as.Date(HPCdata2$Date, format="%d/%m/%Y")
HPCdata2$Time <- paste(HPCdata2$Date, HPCdata2$Time, sep = " ") 

##Filter by only specific days
HPCdata2 <- HPCdata2[HPCdata2$Date == "2007/2/1" | HPCdata2$Date == "2007/2/2",]

HPCdata3 <- HPCdata2

#Format Time column
HPCdata3$Time<- strptime(HPCdata3$Time,format="%Y-%m-%d %H:%M:%S")
head(HPCdata3)

#Plot2
library(datasets)
png(filename = "plot2.png", width = 480 , height = 480 )

with(HPCdata3,plot(Time,Global_active_power, 
                   type = "l",
                   xlab = "", 
                   ylab = "Global Active Power (kilowatts)"))

dev.off() ## Don't forget to close the PNG device!

