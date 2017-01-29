# R Program to plot 

df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
df1 <- subset(df,(Date=="1/2/2007" | Date=="2/2/2007"))
date<-df1$Date
time<-df1$Time
datetime<-paste(date,time)
dt <- strptime(datetime,"%d/%m/%Y %H:%M:%S")
sm1 <-as.numeric(as.character(df1$Sub_metering_1))
sm2 <-as.numeric(as.character(df1$Sub_metering_2))
sm3 <-as.numeric(as.character(df1$Sub_metering_3))
png(filename="plot3.png",width=480,height=480)
plot(dt,sm1,type="l",ylab="Energy sub metering",xlab="")
lines(dt,sm2,col="Red")
lines(dt,sm3,col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'),bty='n',cex=0.75)
dev.off()