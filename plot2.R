
x1<-read.table("./household_power_consumption.txt", sep=";",
               header=TRUE,stringsAsFactors=FALSE,na.strings="?")

x1$new <- paste(x1$Date, x1$Time)
x1$new1<-strptime(x1$new, "%d/%m/%Y %H:%M:%S")

x1$newdate <- as.Date(x1$new1)
x3<-x1[x1$newdate >= "2007-02-01" & x1$newdate <= "2007-02-02",]


png("plot2.png",width=480, height=480, units="px")
par(mfcol=c(1,1))
plot( x3$new1,x3$Global_active_power, type="n",
      ylab="Global Active Power (Kilowatts)",
      xlab="") 
lines(x3$new1,x3$Global_active_power,type="l") 
dev.off()