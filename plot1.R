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
G=as.numeric(as.character(data$Global_active_power))
hist(G,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off() 