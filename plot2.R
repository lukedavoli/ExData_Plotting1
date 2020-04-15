source("produce_dataset.R")
epc <- produceDataset()

png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(epc, plot(DateTime, Global_active_power, type = "l", lty = 1,
               ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
