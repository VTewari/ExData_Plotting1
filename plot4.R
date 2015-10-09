
x1<-read.table("./household_power_consumption.txt", sep=";",
               header=TRUE,stringsAsFactors=FALSE,na.strings="?")

x1$new <- paste(x1$Date, x1$Time)
x1$new1<-strptime(x1$new, "%d/%m/%Y %H:%M:%S")

x1$newdate <- as.Date(x1$new1)
x3<-x1[x1$newdate >= "2007-02-01" & x1$newdate <= "2007-02-02",]


png("plot4.png",width=480, height=480, units="px")
par(mfcol=c(2,2))
plot( x3$new1,x3$Global_active_power, type="n",
      ylab="Global Active Power",
      xlab="") 
lines(x3$new1,x3$Global_active_power,type="l") 

plot( x3$new1,x3$Sub_metering_1, type="n",
      ylab="Energy sub metering",
      xlab="") 
lines(x3$new1,x3$Sub_metering_1,type="l") 
lines(x3$new1,x3$Sub_metering_2,type="l",col="red") 
lines(x3$new1,x3$Sub_metering_3,type="l",col="blue") 
legend("topright",  col = c("black","red", "blue"), 
       lty=1,bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot( x3$new1,x3$Voltage, type="n",
      ylab="Voltage",
      xlab="datetime") 
lines(x3$new1,x3$Voltage,type="l") 

plot( x3$new1,x3$Global_reactive_power, type="n",
      ylab="Global_reactive_power",
      xlab="datetime") 
lines(x3$new1,x3$Global_reactive_power,type="l") 

dev.off()