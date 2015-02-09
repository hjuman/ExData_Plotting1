download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./nesto.zip","wget")
unzip("./nesto.zip")
dat<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
data<-dat[(dat$Date=="2007-02-01" | dat$Date=="2007-02-02"),]
dates<-data$Date
times<-data$Time
x<-paste(dates,times)
data$Time<-strptime(x, "%Y-%m-%d %H:%M:%S")
library(datasets)
par(mfrow = c(2, 2))
with(airquality, {
  plot(data$Time,as.numeric(as.character(data$Global_active_power)),xlab="",ylab="Global Active Power",cex=0.05)
  lines(data$Time,as.numeric(as.character(data$Global_active_power)))
  
  plot(data$Time,as.numeric(as.character(data$Voltage)),xlab="datetime",ylab="Voltage",cex=0.05)
  lines(data$Time,as.numeric(as.character(data$Voltage)))
  
  with(data, plot(data$Time,as.numeric(as.character(data$Sub_metering_1)),type="n",xlab="",ylab="Energy of sub metring",cex=0.05))
  with(data,lines(data$Time,as.numeric(as.character(data$Sub_metering_1))))
  with(data, points(data$Time,as.numeric(as.character(data$Sub_metering_2)),type="n",cex=0.05,col="red"))
  with(data,lines(data$Time,as.numeric(as.character(data$Sub_metering_2)),col="red"))
  with(data, points(data$Time,as.numeric(as.character(data$Sub_metering_3)),type="n",cex=0.05,col="blue"))
  with(data,lines(data$Time,as.numeric(as.character(data$Sub_metering_3)),col="blue"))
  legend("topright",lty=c(1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  plot(data$Time,as.numeric(as.character(data$Global_reactive_power)),xlab="datetime",ylab="Global_reactive_power",cex=0.05)
  lines(data$Time,as.numeric(as.character(data$Global_reactive_power)))
})
dev.copy(png, file = "plot4.png")
dev.off()