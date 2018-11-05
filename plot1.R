#Cleaning the data    
    data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)
    data$Date <- as.character(data$Date)
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    data <- subset(data, data$Date > "2007-01-31" & data$Date < "2007-02-03")
    Day <- weekdays(data$Date)
    data <- cbind(data,Day)
    data[,3:8] <- lapply(data[,c(3:8)],as.character)
    data[,3:8] <- lapply(data[,3:8],as.numeric)
    data[,2] <- as.character(data[,2])
    data[,1] <- as.character(data[,1])
    data[,10] <- as.character(data[,10])
    data$rtime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
    
#Histogram Plot
    png(filename = "plot1.png")
        hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    dev.off()