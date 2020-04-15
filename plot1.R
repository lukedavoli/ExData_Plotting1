source("produce_dataset.R")
epc <- produceDataset()

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(epc$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
