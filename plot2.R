source('./powerdata.R')

Sys.setlocale("LC_TIME", "en_US.UTF-8")
power.data <- read.powerdata()

png("plot2.png", width = 480, height = 480, bg = "transparent")

dates <- as.POSIXlt(paste(power.data$Date, power.data$Time), format = "%d/%m/%Y %H:%M:%S")
plot(dates, power.data$Global_active_power, type = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(dates, power.data$Global_active_power)

dev.off()
