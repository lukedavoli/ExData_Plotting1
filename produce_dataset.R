produceDataset <- function()
{
    library(dplyr)
    library(chron)
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
                      stringsAsFactors = FALSE,
                      colClasses = classes, sep = ";", header = TRUE,
                      col.names = c("Date", "Time", "Global_active_power",
                                    "Global_reactive_power", "Voltage",
                                    "Global_intensity", "Sub_metering_1",
                                    "Sub_metering_2", "Sub_metering_3"))
    lapply(epc, class)
    
    epc <- filter(epc, Date == "1/2/2007" | Date == "2/2/2007")
    options(digits = 5)
    epc[ , 3:9] <- apply(epc[ , 3:9], 2, function(x) as.numeric(x))
    epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
    epc$Time <- chron(times=epc$Time)
    epc$DateTime <- strptime(paste(epc$Date, epc$Time), format = "%Y-%m-%d %H:%M:%S")
    
    return(epc)
}

