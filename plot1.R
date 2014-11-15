a<-66638
b<-69517
c<-b-a
a<-a-1
tabAll <- read.table("household_power_consumption.txt", header = 0, sep = ";", skip = a, nrows = c)
cnam<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(tabAll)<-cnam
as.Date(tabAll$Date, format = "%d/%m/%Y")->tabAll$Date1
strptime(mapply(paste,tabAll$Date,tabAll$Time,MoreArgs = list(sep=" ")),format = "%d/%m/%Y %H:%M:%S")->tabAll$Time1
col1="red"
par(mfrow = c(1,1))
xlabs1<-"Global Active Power(kilowatts)"
main1<-"Global Active Power"
hist(tabAll$Global_active_power, col=col1,xlab = xlabs1,main = main1)
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()