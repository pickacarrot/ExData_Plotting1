
setwd("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1")

mydata<-read.table("c:/Users/Sailwind/Desktop/coursera/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";")
 mydata[,1]<-as.Date(mydata[,1], "%d/%m/%Y")
 data1<-mydata[which(mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02"),]

#Plot 3

x=rep(strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"),length(data1[,1]))
for(i in 1:length(x)){
	x[i]<-strptime(paste(data1[i,1],data1[i,2]), format="%Y-%m-%d %H:%M:%S")
}
x[1:10]

png(filename = "plot3.png",width = 480, height = 480, units = "px")

plot(x,as.numeric(as.character(data1[,7])),type='l',ylab="Energy sub metering")

color <- c("red","blue")

for (i in 1:2){
    lines(x,as.numeric(as.character(data1[,7+i])),col = color[i],type = 'l')
}

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()



