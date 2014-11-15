a<-66638
b<-69517
c<-b-a
a<-a-1
tabAll <- read.table("household_power_consumption.txt", header = 0, sep = ";", skip = a, nrows = c)
cnam<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(tabAll)<-cnam
as.Date(tabAll$Date, format = "%d/%m/%Y")->tabAll$Date1
strptime(mapply(paste,tabAll$Date,tabAll$Time,MoreArgs = list(sep=" ")),format = "%d/%m/%Y %H:%M:%S")->tabAll$Time1
par(mfrow = c(2,2))
with(tabAll,plot(Time1,Global_active_power, pch=NA, main = "",xlab = "",ylab = "Global Active Power"))
lines(tabAll$Time1,tabAll$Global_active_power)
with(tabAll,plot(Time1,Voltage, pch=NA, main = "",xlab = "datetime",ylab = "Voltage"))
lines(tabAll$Time1,tabAll$Voltage)
plot(tabAll$Time1,tabAll$Sub_metering_1, pch=NA, main = "",xlab = "",ylab = "Energy sub metering")
lines(tabAll$Time1,tabAll$Sub_metering_1,col="black")
lines(tabAll$Time1,tabAll$Sub_metering_2,col="red")
lines(tabAll$Time1,tabAll$Sub_metering_3,col="blue")
legend("topright",  lwd=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3") ,bty="n",cex=0.73,  pt.cex = 1)
plot(tabAll$Time1,tabAll$Global_reactive_power, pch=NA, main = "",xlab = "datetime",ylab = "Global_reactive_power")
lines(tabAll$Time1,tabAll$Global_reactive_power)
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()