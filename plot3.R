plot3 <- function(){
    #read the file and take out the dates we need
    # (in a lazy sloppy way since this isn't the goal of the excercise)
    dat <- read.table("./Data./household_power_consumption.txt",sep=";",header=T,na.strings="?")
    dat2 <- dat[dat$Date=='1/2/2007',]
    dat3 <- dat[dat$Date=='2/2/2007',]
    data = rbind(dat2,dat3)
    
    #new vector with our dates in a usable format
    date <- as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
    data = cbind(data,date) #dates in the right class now in the lowercase d date column
    
    #open our png device (in the data folder)
    png(filename="./Data/plot3.png",width=480,height=480)
    
    #plot our...plot
    #first submetering, creates the plot
    with(data,plot(date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
    #second and third annotate
    with(data,points(date,Sub_metering_2,type="l",col="red"))
    with(data,points(date,Sub_metering_3,type="l",col="blue"))
    #add the legend
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    dev.off() #close our file device
}