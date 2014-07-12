## Exploratory_Data_Analysis Course Project 1: Plot 1 

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

# creating the plot in R 
    par(mfrow=c(1,1))
    hist(dataSample$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

# saving plot 1
    dev.copy(png, file = "plot1.png",width=480,height=480) 
    dev.off()