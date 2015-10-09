
x1<-read.table("./household_power_consumption.txt", sep=";",
               header=TRUE,stringsAsFactors=FALSE,na.strings="?")

x1$new <- paste(x1$Date, x1$Time)
x1$new1<-strptime(x1$new, "%d/%m/%Y %H:%M:%S")

x1$newdate <- as.Date(x1$new1)
x3<-x1[x1$newdate >= "2007-02-01" & x1$newdate <= "2007-02-02",]


png("plot3.png",width=480, height=480, units="px")
par(mfcol=c(1,1))
plot( x3$new1,x3$Sub_metering_1, type="n",
      ylab="Energy sub metering",
      xlab="") 
lines(x3$new1,x3$Sub_metering_1,type="l") 
lines(x3$new1,x3$Sub_metering_2,type="l",col="red") 
lines(x3$new1,x3$Sub_metering_3,type="l",col="blue") 
legend("topright",  col = c("black","red", "blue"), 
       lty=1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()