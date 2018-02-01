
##Plot 4 R code

##Extract file data and selecting the data only for 1/2/2007
 and 2/2/2007 for plotting

alldata<- read.table("household_power_consumption.txt", header=TRUE,
 sep=";", na.strings = "?")
data2007<- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))

##Update the date to Date format and create new variable with
##Date and Time joined
data2007$Date<- as.Date(data2007$Date, format="%d/%m/%Y")
data2007$Datetime<- as.POSIXct(paste(data2007$Date, data2007$Time))

## Plot 4 R code
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data2007, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Create PNG file

dev.copy(png, file="plot4.png", height=480, width=480)
## png 
##   3

dev.off()