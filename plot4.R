library(data.table)

# Import data, select Feb 1-2,2007
dat<-fread(file="./household_power_consumption.txt",na.strings="?")
           #select=c("Date","Time","Global_active_power","Global_reactive_power",
            #        "Voltage","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dat_pare <- dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007"]
dateTime <- paste(dat_pare$Date,dat_pare$Time)
x <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# Open graphics device, set background to transparent, create histogram
png(filename="./plot4.png")
par(bg=NA,mfrow=c(2,2))
with(dat_pare, {
  plot(x,Global_active_power,ylab="Global Active Power",xlab=NA,type="n")
  lines(x,Global_active_power)
  plot(x,Voltage,ylab="Voltage",xlab="datetime",type="n")
  lines(x,Voltage)
  plot(x,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=NA)
  lines(x,Sub_metering_1,col="black")
  lines(x,Sub_metering_2,col="red")
  lines(x,Sub_metering_3,col="blue")
  legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty=1,bty="n")
  plot(x,Global_reactive_power,ylab="Global Reactive Power",xlab="datetime",type="n")
  lines(x,Global_reactive_power)
})

# Close device!
dev.off()