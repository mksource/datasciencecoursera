plotgraph4 <- function(){
  
  fileUrl <- "./household_power_consumption.txt"
  data <- read.csv.sql(fileUrl,header=TRUE,sep=";",sql='SELECT * FROM file WHERE (Date="1/2/2007" OR Date="2/2/2007")')
 
  png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
  data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y%H:%M:%S")
  
  #Add 2 rows and 2 columns
  par(mfrow=c(2,2),mar = c(4,4,2,1),oma = c(0,0,3,0))
  par(bg="transparent")
  
  #Plot the various graphs
  with(data,{   
  
  
  plot(data$Date, data$Global_active_power,xlab="",ylab="Global Active Power",type="l",lwd=1)
  
  
  plot(data$Date, data$Voltage,xlab="datetime",ylab="Voltage",type="l",lwd=1)
  
  plot(data$Date, data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",lwd=1)
  lines(data$Date, data$Sub_metering_2,xlab="",ylab="Energy sub metering",type="l",lwd=1,col="Red")
  lines(data$Date, data$Sub_metering_3,xlab="",ylab="Energy sub metering",type="l",lwd=1,col="Blue")
  legend("topright",bty="n",lwd="1",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(data$Date, data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l",lwd=1)
  })
  
  
  dev.off()
  
}