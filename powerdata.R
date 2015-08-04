one.day <- 24 * 60 * 60

read.powerdata <- function(filename = "household_power_consumption.txt",
                           first.observation.date = "2007-02-01", 
                           last.observation.date = "2007-02-02") {
  
  data.info <- read.csv(filename, sep = ";", header = T, nrows = 1)
  first.obs.time <- as.POSIXlt(paste(data.info$Date, data.info$Time), format = "%d/%m/%Y %H:%M:%S")

  first.required.time <- as.POSIXlt(first.observation.date)
  last.required.time <- as.POSIXlt(last.observation.date) + one.day

  first.row <- as.numeric(first.required.time - first.obs.time, units = "mins") + 1
  num.rows <- as.numeric(last.required.time - first.required.time, units = "mins")

  power.data <- read.csv(filename, sep = ";", header = F, skip = first.row, nrows = num.rows, na.strings = c("?"))
  colnames(power.data) <- colnames(data.info)
  
  power.data
}
