
setwd("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1")

mydata<-read.table("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";")
 mydata[,1]<-as.Date(mydata[,1], "%d/%m/%Y")
 data1<-mydata[which(mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02"),]

#Plot 1
png(filename = "plot1.png",width = 480, height = 480, units = "px")

hist(as.numeric(as.character(data1[,3])),col='red',xlab='Global Active Power (kilowatts)',
 	breaks=20,main='Global Active Power')

dev.off()




