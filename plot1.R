if (!file.exists("household_power_consumption.txt"))
{
  fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  # run on Windows, might need to add method = "curl" to download command if running on another OS
  download.file(fileURL, destfile="household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}
if (file.exists("household_power_consumption.txt"))
{
  pow_consump<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
  pow_consump_subset<-pow_consump[(pow_consump$Date=="1/2/2007" | pow_consump$Date=="2/2/2007" ),]
  pow_consump_subset$DateTime<-strptime(paste(pow_consump_subset$Date,pow_consump_subset$Time),"%d/%m/%Y %H:%M:%S")
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  hist(pow_consump_subset$Global_active_power, col = "red", xlab ="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}