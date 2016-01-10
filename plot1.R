plot1 <- function() {
f1 <- file("household_power_consumption.txt")
df <- read.csv(f1,sep= ";",stringsAsFactors = FALSE,na.strings="?")
str(df)
tail(df)
f <- df[complete.cases(df),]
date <- as.Date(f$Date,"%d/%m/%Y")
f <- cbind(f,date)
f <- subset(f,(date == "2007-02-01") | (date == "2007-02-02"))
png("plot1.png", width=480, height=480)
hist(f$Global_active_power,col=2,xlab="Global active power (kilowatts)",main="Global Active Power")
dev.off()
}       
