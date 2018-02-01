

##Plot 3 R code

##Extract file data and selecting the data only for 1/2/2007
 and 2/2/2007 for plotting

alldata<- read.table("household_power_consumption.txt", header=TRUE,
 sep=";", na.strings = "?")
data2007<- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))

##Update the date to Date format and create new variable with
##Date and Time joined
data2007$Date<- as.Date(data2007$Date, format="%d/%m/%Y")
data2007$Datetime<- as.POSIXct(paste(data2007$Date, data2007$Time))

## Plot 3
with(data2007, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
## png 
##   3
 dev.off()
