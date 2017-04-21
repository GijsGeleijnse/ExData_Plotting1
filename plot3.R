plot3 <- function(pt){
  
  png(file="plot3.png")
  par(mfrow=c(1,1))
  with(pt, {plot(Time, Sub_metering_1,type = "l", ylab = "Energy sub metering", col= "black")
  lines(Time, Sub_metering_2,type = "l", col= "red")
  lines(Time, Sub_metering_3,type = "l", col= "blue")})
  
  
  legend("topright",col=c("black","red", "blue"),lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex = 0.75)
  dev.off()
  
}




 
read_power_table <- function(){
  
  pt <- read.table("household_power_consumption.txt", sep=';',header=TRUE)
  pt <- filter(pt, Date %in% c("1/2/2007","2/2/2007"))
 
 
  write.table(pt,"power_consumption_feb1_2.txt")
   
}


read_short_table <- function(){
  
  pt <- read.table("power_consumption_feb1_2.txt",header=TRUE)
  pt$Date <- dmy(pt$Date)
  
  pt$Time <- strptime(paste(pt$Date,pt$Time,sep=" "),format=  "%Y-%m-%d %H:%M:%S")
  pt
  
  
  
  
  
}