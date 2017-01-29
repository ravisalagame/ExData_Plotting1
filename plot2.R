# R Program to plot 

df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
df1 <- subset(df,(Date=="1/2/2007" | Date=="2/2/2007"))
df2 <- df1$Global_active_power
GAP <- as.numeric(as.character(df2))
date<-df1$Date
time<-df1$Time
datetime<-paste(date,time)
dt <- strptime(datetime,"%d/%m/%Y %H:%M:%S")
png(filename="plot2.png",width=480,height=480)
plot(dt,GAP,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()