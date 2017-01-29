# R Program to plot 

df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
df1 <- subset(df,(Date=="1/2/2007" | Date=="2/2/2007"))
df2 <- df1$Global_active_power
GAP <- as.numeric(as.character(df2))
png(filename="plot1.png",width=480,height=480)
hist(GAP,col="RED",ylim=c(0,1200),xlab="Global Active Power(Kilowatts)",main=paste("Global Active Power"))
dev.off()