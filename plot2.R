plotgraph2 <- function(){
  
  #Read the data from text file while reading make sure we read rows where Date is on 1st and 2nd Feb 2007
  fileUrl <- "./household_power_consumption.txt"
  data <- read.csv.sql(fileUrl,header=TRUE,sep=";",sql='SELECT * FROM file WHERE (Date="1/2/2007" OR Date="2/2/2007")')
  
  
  #Get the graphic device as png
  png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
  
  #Set the background as transparent
  par(bg="transparent")
  
  #Convert the Date format so that we can plot it
  data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y%H:%M:%S")
  
  #use plot function
  plot(data$Date, data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l",lwd=1)
  
  #close graphic device
  dev.off()
  
}