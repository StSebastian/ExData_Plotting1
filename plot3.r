## Exploratory_Data_Analysis Course Project 1: Plot 3

# setting directory
    currentDirectory <- getwd()
    newDirectory <- paste(currentDirectory,"/CourseProject1",sep="")
    if(!file.exists("CourseProject1")){
    dir.create("CourseProject1")
    }
    setwd(newDirectory)

# loading file
    setInternet2()
    file<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(file,"data.zip")    
    unzip("data.zip")
    data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F)

# modifying the data
    dataSample <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
    dataSample$Date<-as.Date(strptime(dataSample$Date,"%d/%m/%Y"))
    dataSample$Global_active_power<-as.numeric(dataSample$Global_active_power)
    dataSample$Time2<-strptime(paste(dataSample$Date,dataSample$Time),"%Y-%m-%d %H:%M:%S")
    dataSample$Sub_metering_1<-as.numeric(dataSample$Sub_metering_1)
    dataSample$Sub_metering_2<-as.numeric(dataSample$Sub_metering_2)
    dataSample$Sub_metering_3<-as.numeric(dataSample$Sub_metering_3)

# creating the plot in R 
    par(mfrow=c(1,1))
    with(dataSample,plot(Time2,Sub_metering_1,main="",type = "l",ylab="Energy sub metering",xlab=""))
    with(dataSample,points(Time2,Sub_metering_2,type = "l",col="red"))
    with(dataSample,points(Time2,Sub_metering_3,type = "l",col="blue"))
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1),col = c("black","blue", "red"), cex=0.8)

# saving plot 3
    dev.copy(png, file = "plot3.png",width=480,height=480) 
    dev.off()