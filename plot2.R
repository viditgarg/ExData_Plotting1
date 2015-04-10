data_csv <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
head(data_csv)
summary(data_csv)

## coverting data_full$Date values in 'date'format - yyyy-mm-dd

data_csv$Date <- as.Date(data_csv$Date, format="%d/%m/%Y")

## subsetting the date between 2007-02-01 and 2007-02-02
data_sub <- subset(data_csv, Date >= "2007-02-01" & Date <= "2007-02-02")
## removing full data from memory
rm(data_csv)

## Plotting graph between Global_active_power (Y axis) agianst time 

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)

data_sub$Datetime <- as.POSIXct(datetime)

par(mfrow = c(1,1), mar=c(5,5,2,2))

plot(data_sub$Global_active_power~data_sub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
