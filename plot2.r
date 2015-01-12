
setwd("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1")

mydata<-read.table("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";")
 mydata[,1]<-as.Date(mydata[,1], "%d/%m/%Y")
 data1<-mydata[which(mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02"),]

#Plot 2
x=rep(strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"),length(data1[,1]))
for(i in 1:length(x)){
	x[i]<-strptime(paste(data1[i,1],data1[i,2]), format="%Y-%m-%d %H:%M:%S")
}
x[1:10]

png(filename = "plot2.png",width = 480, height = 480, units = "px")

plot(x,as.numeric(as.character(data1[,3])),type='l',ylab='Global Active Power (kilowatts)')

dev.off()





