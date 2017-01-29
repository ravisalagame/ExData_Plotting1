# R Program to plot 
png(filename="plot4.png",width=480,height=480)
df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
df1 <- subset(df,(Date=="1/2/2007" | Date=="2/2/2007"))
df2 <- df1$Global_active_power
GAP <- as.numeric(as.character(df2))
date<-df1$Date
time<-df1$Time
datetime<-paste(date,time)
dt <- strptime(datetime,"%d/%m/%Y %H:%M:%S")
# Get 2,2 canvas
par(mfrow=c(2,2))

# Plot Graph1 at (1,1) - Global Active Power v/s Time
plot(dt,GAP,type="l",ylab="Global Active Power",xlab="")

# Plot Graph2 at (1,2) - Votage v/s Time
voltage<-as.numeric(as.character(df1$Voltage))
plot(dt,voltage,type="l",ylab="Voltage",xlab="")

# Plot Graph3 at (2,1) - Multiple graphs of sub-metering

sm1 <-as.numeric(as.character(df1$Sub_metering_1))
sm2 <-as.numeric(as.character(df1$Sub_metering_2))
sm3 <-as.numeric(as.character(df1$Sub_metering_3))
plot(dt,sm1,type="l",ylab="Energy sub metering",xlab="")
lines(dt,sm2,col="Red")
lines(dt,sm3,col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'),bty='n',cex=0.75)

# Plot Graph4 at (2,2) - Global Reactive Power v/s Time
GRP<-as.numeric(as.character(df1$Global_reactive_power))
plot(dt,GRP,type="l",ylab="Global_reactive_power",xlab="",ylim=c(0.0,0.5))
dev.off()
