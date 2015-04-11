plot4 <- function(){
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
    png(filename="./Data/plot4.png",width=480,height=480)
    
    #plot our...plots
    par(mfrow = c(2,2))
    
    with(data, {
        #1st plot
        plot(date,Global_active_power,type="l",xlab="",ylab="Global Active Power")
        
        #2nd plot
        plot(date,Voltage,type="l",xlab="datetime",ylab="Voltage")
        
        #third plot, create the plot then annotate
        plot(date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        #second and third annotate
        points(date,Sub_metering_2,type="l",col="red")
        points(date,Sub_metering_3,type="l",col="blue")
        #add the legend
        legend("topright", lty=1, col=c("black","red","blue"),bty="n",cex=.7,
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        #4th plot
        plot(date,Global_reactive_power,type="l",xlab="datetime")
        
    })
    dev.off() #close our file device
}