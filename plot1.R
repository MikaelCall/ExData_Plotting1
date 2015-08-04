source('./powerdata.R')

power.data <- read.powerdata()

png("plot1.png", width = 480, height = 480, bg = "transparent")

hist(power.data$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

dev.off()
