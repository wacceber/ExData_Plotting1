#  Rebecca Love
#  wacceber
#  Exploratory Data Analysis 
#  Week 1 Assignment
#  Plot 3
#  plot3.r


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
#  create plot3 function of a line chart, add spaces to legend text to prevent page overflow in the image
plot3 <- function() {
     # legendtext <- cbind(colnames(subsetPowerDay1Day2Feb2007)[7:9])
     plot(subsetPowerDay1Day2Feb2007$DateTime, subsetPowerDay1Day2Feb2007$Sub_metering_1, type ="l", xlab="", ylab = "Energy sub metering", cex.lab = .75, cex.axis = .75)
     lines(subsetPowerDay1Day2Feb2007$DateTime, subsetPowerDay1Day2Feb2007$Sub_metering_2, col = "red")
     lines(subsetPowerDay1Day2Feb2007$DateTime, subsetPowerDay1Day2Feb2007$Sub_metering_3, col = "blue")
     #  add spaces to end of labels and increase y interspace to render correctly
     legend("topright", col = c("black","red","blue"), c("Sub_metering_1         ", "Sub_metering_2         ", "Sub_metering_3         "),lty=c(1,1), lwd=c(1,1), y.intersp = 1.5,  cex = .75)
     # legend("topright", col = c("black","red","blue"), c(legendtext),lty=c(1,1), lwd=c(1,1), y.intersp = 1, cex = .75)
     }
plot3()
# copy current plot to png file
dev.copy(png, file = "plot3.png", width=480, height=480)
#  close the png device
dev.off()


