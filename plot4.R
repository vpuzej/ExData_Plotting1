plot4 <- function() {
  
  f1 <- file("household_power_consumption.txt")
  df <- read.csv(f1,sep= ";",stringsAsFactors = FALSE,na.strings="?")
  f <- df[complete.cases(df),]
  date <- as.Date(f$Date,"%d/%m/%Y")
  f <- cbind(f,date)
  f <- subset(f,(date == "2007-02-01") | (date == "2007-02-02"))
  dw <- weekdays(f$date)
  f <- cbind(f,dw)
  f <- cbind(f,dt_text = paste(f$Date,f$Time))
  f <- cbind(f,dt = strptime(f$dt_text,"%d/%m/%Y %H:%M:%OS"))
  png("plot4.png", width=480, height=480)
  par(mfcol=c(2,2))
  
  plot(f$dt,f$Global_active_power,xlab=" ",ylab="Global active power (kilowatts)",type="l")
  
  plot(f$dt,f$Sub_metering_1,type="n",xlab=" ",ylab="Enrergy sub metering")
  with(f,lines(f$dt,f$Sub_metering_1,col="black"))
  with(f,lines(f$dt,f$Sub_metering_2,col="red"))
  with(f,lines(f$dt,f$Sub_metering_3,col="blue"))
  legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(f$dt,f$Voltage,xlab="datetime ",ylab="Voltage",type="l")
 
  plot(f$dt,f$Global_reactive_power,xlab="datetime ",ylab="Global_reactive_power",type="l")
  dev.off()
}       