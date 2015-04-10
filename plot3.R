data_csv <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
head(data_csv)
summary(data_csv)

## coverting data_full$Date values in 'date'format - yyyy-mm-dd

data_csv$Date <- as.Date(data_csv$Date, format="%d/%m/%Y")

## subsetting the date between 2007-02-01 and 2007-02-02
data_sub <- subset(data_csv, Date >= "2007-02-01" & Date <= "2007-02-02")
## removing full data from memory
rm(data_csv)

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)


## Plotting 

par(mfrow = c(1,1), mar=c(5,5,2,2))
with(data_sub, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy Sub Metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()