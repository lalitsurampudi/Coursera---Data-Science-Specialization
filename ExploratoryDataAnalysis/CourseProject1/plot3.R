# COURSE PROJECT 1
setwd("C:/Users/lsurampudi/Documents/Coursera/ExploratoryDataAnalysis/CourseProject1")
unzip("exdata_household_power_consumption.zip")
list.files()

# Read input data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
format(object.size(data), units="Gb")
#dim(data)
#str(data)
#head(data)
#summary(data)

# Working with variables with in data frame
dat <- na.omit(data)
#dim(data)[1] - dim(dat)[1]
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
df <- subset(dat, Date >= '2007-02-01' & Date <= '2007-02-02')
df$Time <- strptime(paste(df$Date,df$Time), "%Y-%m-%d %H:%M:%S")
names(df$Time) <- "datetime"
names(df)[match("Time",names(df))] <- "datetime"
#str(df)
#summary(df)

# Convert variables to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
#summary(df)
#summary(df$Global_active_power)

# PLOT 3
with(df, plot(datetime, Sub_metering_1, type='l', xlab = "", ylab = "Energy sub metering", col="black"))
with(df, lines(datetime, Sub_metering_2, col="red"))
with(df, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", pch = '___', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()

rm(list = ls())