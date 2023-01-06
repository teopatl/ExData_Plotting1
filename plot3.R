library(data.table)

# Import data, select Feb 1-2,2007
dat<-fread(file="./household_power_consumption.txt",na.strings="?", 
           select=c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dat_pare <- dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007"]
dateTime <- paste(dat_pare$Date,dat_pare$Time)
x <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# Open graphics device, set background to transparent, create plot, lines, and histogram
png(filename="./plot3.png")
par(bg=NA)
plot(x,dat_pare$Sub_metering_1,type="n",ylab="Energy sub metering",xlab=NA)
lines(x,dat_pare$Sub_metering_1,col="black")
lines(x,dat_pare$Sub_metering_2,col="red")
lines(x,dat_pare$Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)

# Close device!
dev.off()