plot2 <- function() {
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
  png("plot2.png", width=480, height=480)
  plot(f$dt,f$Global_active_power,xlab=" ",ylab="Global active power (kilowatts)",type="l")
  dev.off()
  }       