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
par(mfrow=c(1,1))
plot(data$Time,as.numeric(as.character(data$Global_active_power)),xlab="DateTime",ylab="Global Active Power (kilowatts)",cex=0.05)
lines(data$Time,as.numeric(as.character(data$Global_active_power)))
dev.copy(png, file = "plot2.png")
dev.off() 