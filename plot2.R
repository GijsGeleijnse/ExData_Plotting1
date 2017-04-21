plot2 <- function(pt){
  
  png(file="plot2.png")
  par(mfrow=c(1,1))
  plot(pt$Time, pt$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
  
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