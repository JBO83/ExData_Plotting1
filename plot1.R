#Only obtain the relevant information.
grep_no<-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1
n_no<-grep("3/2/2007", readLines("household_power_consumption.txt"))[1]-grep_no-1
dat<-read.table("household_power_consumption.txt",skip=grep_no,nrows=n_no,sep=";")
names(dat)<-read.table("household_power_consumption.txt",nrows=1,sep=";")
time_vec<-strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

### Plot 1
png(file="plot1.png",height = 480,width = 480) # Width and height same as default
hist(dat$Global_active_power,col="red",xlab = "Global Active Power (kilowats)",main="Global Active Power")
dev.off()