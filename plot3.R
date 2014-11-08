setwd("~/Documents/Coursera/Exploratory Data Analysis/EDA-CP1")
library(foreign)
data<-read.table("household_power_consumption.txt",sep=";",header=T)

subdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
attach(subdata)
datetime<-strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(datetime, Sub_metering_2,col="red")
lines(datetime, Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
       "Sub_metering_2","Sub_metering_3"),lwd=2)
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
