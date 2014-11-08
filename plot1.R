setwd("U:/R Directory/EDA1")
library(foreign)
data<-read.table("household_power_consumption.txt",sep=";",header=T)
subdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
attach(subdata)

hist(ActPower,breaks=15,col="red",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",
     main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
