plot1 <- function(pt){
  
  png(file="plot1.png")
  par(mfrow=c(1,1))
  hist(pt$Global_active_power, main= "Global Active Power", col="red",
       xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  
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