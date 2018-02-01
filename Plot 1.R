##Plot 1 R code

##Extract file data and selecting the data only for 1/2/2007
 and 2/2/2007 for plotting

alldata<- read.table("household_power_consumption.txt", header=TRUE,
 sep=";", na.strings = "?")
data2007<- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))

##Update the date to Date format and create new variable with
##Date and Time joined
data2007$Date<- as.Date(data2007$Date, format="%d/%m/%Y")
data2007$Datetime<- as.POSIXct(paste(data2007$Date, data2007$Time))


## plot 1
hist(as.numeric(data2007$Global_active_power), col="Red",
 main="Global Active Power", xlab="Global Active power (kilowatts)", 
ylab="Frequency")

##Create the PNG file
png("plot1.png", width=480, height=480)
dev.off()