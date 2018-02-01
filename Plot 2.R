
#Plot 2 R code

##Extract file data and selecting the data only for 1/2/2007
 and 2/2/2007 for plotting

alldata<- read.table("household_power_consumption.txt", header=TRUE,
 sep=";", na.strings = "?")
data2007<- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))

#Update the date to Date format and create new variable with
#Date and Time joined
data2007$Date<- as.Date(data2007$Date, format="%d/%m/%Y")
data2007$Datetime<- as.POSIXct(paste(data2007$Date, data2007$Time))


## Plot 2

with(data2007, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })

# Create the PNG file

dev.copy(png, file="plot2.png", height=480, width=480)
## png 
##   3
dev.off()