#Only obtain the relevant information.
grep_no<-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1
n_no<-grep("3/2/2007", readLines("household_power_consumption.txt"))[1]-grep_no-1
dat<-read.table("household_power_consumption.txt",skip=grep_no,nrows=n_no,sep=";")
names(dat)<-read.table("household_power_consumption.txt",nrows=1,sep=";")
time_vec<-strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

#Plot the graph
png(file="plot2.png",height = 480,width = 480) # Width and height same as default
plot(time_vec, dat$Global_active_power, type = "l",ylab = "Global Active Power (kilowats)",xlab="")
dev.off()