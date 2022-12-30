#plot 1

power <- read.csv("household_power_consumption.txt", sep=";")

# convert ? to na
power[power=="?"] <- NA

# convert columns back to numeric
power2 <- cbind(power[,1:2],  as.data.frame(sapply(power[,3:9], as.numeric)))

# convert date/time column to date
power2$DateTime <- as.POSIXct(strptime(paste(power2$Date, power2$Time), format="%d/%m/%Y %H:%M:%S"))
str(power2)

# keep only specified dates
power3 <- power2[(as.Date(power2$DateTime) >= as.Date("2007-02-01")) 
                & (as.Date(power2$DateTime) <= as.Date("2007-02-02")), ]


############## create plot 1 ##############

hist(power3$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
        main="Global Active Power")
dev.copy(png, filename="plot1.png")
dev.off()

