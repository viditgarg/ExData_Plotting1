data_csv <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
head(data_csv)
summary(data_csv)

## coverting data_full$Date values in 'date'format - yyyy-mm-dd

data_csv$Date <- as.Date(data_csv$Date, format="%d/%m/%Y")

## subsetting the date between 2007-02-01 and 2007-02-02
data_sub <- subset(data_csv, Date >= "2007-02-01" & Date <= "2007-02-02")
## removing full data from memory
rm(data_csv)
## Plotting histogram plot of Global_active_power against frequency

par(mfrow = c(1,1), mar=c(5,5,2,2))
hist(data_sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
