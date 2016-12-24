#  Rebecca Love
#  wacceber
#  Exploratory Data Analysis 
#  Week 1 Assignment
#  Plot 1
#  plot1.r

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
#  plot a histogram of Global_active_power, include font sizing
hist(subsetPowerDay1Day2Feb2007$Global_active_power, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", cex.lab = .75, cex.axis = .75, cex.main=.85, cex.sub=.75)
# copy current plot to png file
dev.copy(png, file = "plot1.png", width=480, height=480)
#  close the png device
dev.off()