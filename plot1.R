plot1 <- function(){
    #read the file and take out the dates we need
    # (in a lazy sloppy way since this isn't the goal of the excercise)
    dat <- read.table("./Data./household_power_consumption.txt",sep=";",header=T,na.strings="?")
    dat2 <- dat[dat$Date=='1/2/2007',]
    dat3 <- dat[dat$Date=='2/2/2007',]
    data = rbind(dat2,dat3)
    
    #open our png device (in the data folder)
    png(filename="./Data/plot1.png",width=480,height=480)
    
    #plot our...plot
    hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
    
    dev.off() #close our file device
}