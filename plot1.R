library(data.table)
dtdata <- fread(input = "household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
names(dtdata) <- tolower(names(dtdata))
dtdata <- dtdata[, date:= as.Date(x = date, format = "%d/%m/%Y")]
dtdata <- dtdata[ date >= as.Date("2007-02-01") & date <= as.Date("2007-02-02"), ]

hist(dtdata$global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")
## Close the PNG device!
dev.off()