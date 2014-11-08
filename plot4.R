setwd("~/Documents/Coursera/Exploratory Data Analysis/EDA-CP1")
library(foreign)
data<-read.table("household_power_consumption.txt",sep=";",header=T)

subdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
attach(subdata)
datetime<-strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

ActPower<-as.numeric(subdata$Global_active_power)
ActPower<-ActPower/500
plot(datetime,ActPower,type="l",
     ylab="Global Active Power", xlab="",cex.lab=0.75)

volts<-as.numeric(subdata$Voltage)
volts<-(volts/100)+226
plot(datetime,volts,type="l",xlab="datetime",ylab="Voltage",cex.lab=0.75)

plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering", xlab="",cex.lab=0.75,yaxt='n')
lines(datetime, Sub_metering_2,col="red")
lines(datetime, Sub_metering_3,col="blue")
axis(side=2,at=seq(0,30,by=10))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
       "Sub_metering_2","Sub_metering_3"),lwd=2,cex=0.5,bty="n")

ReactPower<-as.numeric(subdata$Global_reactive_power)
ReactPower<-ReactPower/500
plot(datetime,ReactPower,type="l",ylab="Global_reactive_power",yaxt='n',xlab="datetime",cex.lab=0.75)
axis(side=2,at=seq(0,0.5,by=0.1))

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
