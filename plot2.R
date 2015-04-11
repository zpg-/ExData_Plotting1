plot2 <- function(){
    #read the file and take out the dates we need
    # (in a lazy sloppy way since this isn't the goal of the excercise)
    dat <- read.table("./Data./household_power_consumption.txt",sep=";",header=T,na.strings="?")
    dat2 <- dat[dat$Date=='1/2/2007',]
    dat3 <- dat[dat$Date=='2/2/2007',]
    data = rbind(dat2,dat3)
    
    #new vector with our dates in a usable format
    date <- as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
    
    #open our png device (in the data folder)
    png(filename="./Data/plot2.png",width=480,height=480)
    
    #plot our...plot
    plot(date,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
    
    dev.off() #close our file device
}