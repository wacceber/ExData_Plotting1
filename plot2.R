#  Rebecca Love
#  wacceber
#  Exploratory Data Analysis 
#  Week 1 Assignment
#  Plot 2
#  plot2.r

#  import dataset into variable
power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# check dataset
head(power)
#check the class of power$Date
class(power$Date)
# change the class of power$Date to date
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
# subset the data of column date of 2007-02-01 and 2007-02-02
subsetPowerDay1Day2Feb2007 <- subset(power, Date == "2007-02-01" |  Date == "2007-02-02")

#  combine Date and Time column into one column 
subsetPowerDay1Day2Feb2007 <- transform(subsetPowerDay1Day2Feb2007, DateTime=as.POSIXct(paste(Date, Time)))
# plot a line chart, include font sizing
plot(subsetPowerDay1Day2Feb2007$DateTime, subsetPowerDay1Day2Feb2007$Global_active_power, type ="l", xlab="", ylab = "Global Active Power (kilowatts)", cex.lab = .75, cex.axis = .75)

# copy current plot to png file
dev.copy(png, file = "plot2.png", width=480, height=480)
#  close the png device
dev.off()
