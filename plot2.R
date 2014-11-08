setwd("U:/R Directory/EDA1")
library(foreign)
data<-read.table("household_power_consumption.txt",sep=";",header=T)

subdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

datetime<-strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ActPower<-as.numeric(subdata$Global_active_power)

plot(datetime,ActPower,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
