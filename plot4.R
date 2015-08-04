source('./powerdata.R')

Sys.setlocale("LC_TIME", "en_US.UTF-8")
power.data <- read.powerdata()

png("plot4.png", width = 480, height = 480, bg = "transparent")

datetime <- as.POSIXlt(paste(power.data$Date, power.data$Time), format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))

with(power.data, { 
  plot(datetime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
  lines(datetime, Global_active_power)
  
  plot(datetime, Voltage, type = "n")
  lines(datetime, Voltage)#
  
  plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_1, col = "black")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"),
         lwd = 3, bty = "n")
  
  plot(datetime, Global_reactive_power, type = "n")
  lines(datetime, Global_reactive_power)
})

dev.off()
