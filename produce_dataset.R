filename = "electricPowerConsumption_zip"

if(!file.exists(filename))
{
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, destfile = "electricPowerConsumption_zip", method="curl")
}

if(!file.exists("household_power_consumption"))
{
    unzip(filename) 
}

initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 10)
classes <- sapply(initial, class)
epc <- read.table(file = "household_power_consumption.txt", 
                  colClasses = classes, sep = ";", header = TRUE,
                  col.names = c("Date", "Time", "Global_active_power",
                                "Global_reactive_power", "Voltage",
                                "Global_intensity", "Sub_metering_1",
                                "Sub_metering_2", "Sub_metering_3"))
epc$Date <- as.Date(epc$Date)
epc$Time <- strptime(epc$Time, "%HH:%MM:%SS")
