source("produce_dataset.R")
epc <- produceDataset()

png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(epc, plot(DateTime, Sub_metering_1, type = "n",
               ylab = "Energy sub metering", xlab = ""))

lines(epc$DateTime, epc$Sub_metering_1, type = "l", col = "black")
lines(epc$DateTime, epc$Sub_metering_2, type = "l", col = "red")
lines(epc$DateTime, epc$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
