library(data.table)

# Import data, select Feb 1-2,2007
dat<-fread(file="./household_power_consumption.txt",na.strings="?", select=c("Date","Time","Global_active_power"))
dat_pare <- dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007"]
dateTime <- paste(dat_pare$Date,dat_pare$Time)
x <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# Open graphics device, set background to transparent, create histogram
png(filename="./plot2.png")
par(bg=NA)
plot(x,dat_pare$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=NA)
lines(x,dat_pare$Global_active_power)

# Close device!
dev.off()