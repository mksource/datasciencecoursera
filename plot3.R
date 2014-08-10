plotgraph3 <- function(){
  
  #Read the data from text file while reading make sure we read rows where Date is on 1st and 2nd Feb 2007 
  fileUrl <- "./household_power_consumption.txt"
  data <- read.csv.sql(fileUrl,header=TRUE,sep=";",sql='SELECT * FROM file WHERE (Date="1/2/2007" OR Date="2/2/2007")')
  
  #Get the graphic device as png
  png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
  par(bg="transparent")
  data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y%H:%M:%S")
  
  #Plot the first ssub metering 
  plot(data$Date, data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",lwd=1)
  
  #Add the rest of the sub metering
  lines(data$Date, data$Sub_metering_2,xlab="",ylab="Energy sub metering",type="l",lwd=1,col="Red")
  lines(data$Date, data$Sub_metering_3,xlab="",ylab="Energy sub metering",type="l",lwd=1,col="Blue")
  
  #Add the legend to top right corner 
  legend("topright",lty="solid",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Turn off the graphic device
  dev.off()
  
}