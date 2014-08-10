plotgraph1 <- function(){
  
             #Read the data from text file while reading make sure we read rows where Date is on 1st and 2nd Feb 2007  
             fileUrl <- "./household_power_consumption.txt"
             data <- read.csv.sql(fileUrl,header=TRUE,sep=";",sql='SELECT * FROM file WHERE (Date="1/2/2007" OR Date="2/2/2007")')
             
             #Get the graphic device as png
             png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
             
             #Set the background as transparent
             par(bg="transparent")
             
             #Plot as a histogram with color of the bar as Red
             hist(data$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (Kilowatts)")
           
             #Close the graphic device
             dev.off()
             
}