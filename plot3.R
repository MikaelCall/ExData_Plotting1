source('./powerdata.R')

Sys.setlocale("LC_TIME", "en_US.UTF-8")
power.data <- read.powerdata()

png("plot3.png", width = 480, height = 480, bg = "transparent")

dates <- as.POSIXlt(paste(power.data$Date, power.data$Time), format = "%d/%m/%Y %H:%M:%S")
with(power.data, { 
  plot(dates, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(dates, Sub_metering_1, col = "black")
  lines(dates, Sub_metering_2, col = "red")
  lines(dates, Sub_metering_3, col = "blue")
})

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lwd = 3)

dev.off()
