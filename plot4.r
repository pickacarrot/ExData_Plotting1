
setwd("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1")

mydata<-read.table("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";")
 mydata[,1]<-as.Date(mydata[,1], "%d/%m/%Y")
 data1<-mydata[which(mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02"),]

#Plot 4
setwd("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1")

x=rep(strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"),length(data1[,1]))
for(i in 1:length(x)){
	x[i]<-strptime(paste(data1[i,1],data1[i,2]), format="%Y-%m-%d %H:%M:%S")
}
x[1:10]

png(filename = "plot4.png",width = 480, height = 480, units = "px")

par(mfrow=c(2,2))


#1
plot(x,as.numeric(as.character(data1[,3])),type='l',ylab='Global Active Power (kilowatts)',xlab='')

#2
plot(x,as.numeric(as.character(data1[,5])),type='l',ylab='Voltage',xlab='datetime')


#3
plot(x,as.numeric(as.character(data1[,7])),type='l',ylab="Energy sub metering",xlab='')

color <- c("red","blue")

for (i in 1:2){
    lines(x,as.numeric(as.character(data1[,7+i])),col = color[i],type = 'l')
}

#legend("topright",border=0,box.col = 0,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#4
plot(x,as.numeric(as.character(data1[,4])),type='l',ylab='Global_reactive_power',xlab='datetime')

dev.off()


