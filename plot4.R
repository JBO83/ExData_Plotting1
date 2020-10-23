#Only obtain the relevant information.
grep_no<-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1
n_no<-grep("3/2/2007", readLines("household_power_consumption.txt"))[1]-grep_no-1
dat<-read.table("household_power_consumption.txt",skip=grep_no,nrows=n_no,sep=";")
names(dat)<-read.table("household_power_consumption.txt",nrows=1,sep=";")
time_vec<-strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

#### Plot 4
png(file="plot4.png",height = 480,width = 480) # Width and height same as default
par(mfrow=c(2,2)) #Change plot setting to show 2X2

plot(time_vec, dat$Global_active_power, type = "l",ylab = "Global Active Power",xlab="")

plot(time_vec, dat$Voltage, type = "l",ylab = "Voltage",xlab="Datetime")

plot(time_vec, dat$Sub_metering_1, type = "l",ylab = "Energy sub metering",xlab="")
lines(time_vec, dat$Sub_metering_2, col="red")
lines(time_vec, dat$Sub_metering_3, col="blue")
legend("topright", lty=rep(1,3), col = c("black", "red", "blue"),legend=c("sub_meltering_1","sub_meltering_2","sub_meltering_3"))

plot(time_vec, dat$Global_reactive_power, type = "l",xlab="Datetime")
dev.off()