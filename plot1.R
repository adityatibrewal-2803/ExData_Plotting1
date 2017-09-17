setwd("C:/00-AdityaTibrewal/Data_Science_Coursera/Exploratory Analysis/W1/ExData_Plotting1")

library(dplyr)
library(lubridate)

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName = "./data/power.zip"

## Downloading and unzipping the dataset
if (!file.exists("./data")) {
    dir.create("./data")
}

if (!file.exists(fileName)) {
    download.file(fileUrl, destfile = fileName)
    unzip(fileName, exdir = "./data")
}

powerDf = read.table("./data/household_power_consumption.txt", na.strings = c("?"),
                     stringsAsFactors = FALSE, sep = ";", header = TRUE)
powerDf1 = tbl_df(powerDf)
powerDf1$Date = dmy(powerDf$Date)
# Selecting data for the given days only
powerDf1 = filter(powerDf1, Date == dmy(01022007) | Date == dmy(02022007))

# Rendering the histogram
with(powerDf1, hist(Global_active_power, col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.copy(png, "plot1.png", width = 480, height = 480, unit = "px")
dev.off()
