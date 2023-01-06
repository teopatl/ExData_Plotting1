library(data.table)

# Import data, select Feb 1-2,2007
dat<-fread(file="./household_power_consumption.txt",na.strings="?", select=c("Date","Global_active_power"))
dat_pare <- dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007"]

# Open graphics device, set background to transparent, create histogram
png(filename="./plot1.png")
par(bg=NA)
hist(dat_pare$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")

# Close device!
dev.off()