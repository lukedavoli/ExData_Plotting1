source("produce_dataset.R")
epc <- produceDataset()

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2))

#Plot 1
with(epc, plot(DateTime, Global_active_power, type = "l", lty = 1,
               ylab = "Global Active Power", xlab = ""))

#Plot 2
with(epc, plot(DateTime, Sub_metering_1, type = "n",
               ylab = "Energy sub metering", xlab = ""))
lines(epc$DateTime, epc$Sub_metering_1, type = "l", col = "black")
lines(epc$DateTime, epc$Sub_metering_2, type = "l", col = "red")
lines(epc$DateTime, epc$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col=c("black", "red", "blue"), bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 3
with(epc, plot(DateTime, Voltage, type = "l", lty = 1, xlab = "datetime"))

#Plot 4
with(epc, plot(DateTime, Global_reactive_power,
               type = "l", lty = 1, xlab = "datetime"))

dev.off()
