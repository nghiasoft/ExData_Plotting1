library(data.table)
dtdata <- fread(input = "household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
names(dtdata) <- tolower(names(dtdata))
dtdata <- dtdata[, date:= as.Date(x = date, format = "%d/%m/%Y")]
dtdata <- dtdata[ date >= as.Date("2007-02-01") & date <= as.Date("2007-02-02"), ]

with(dtdata, plot(x  = as.POSIXct(paste(date, time),
                                  format="%Y-%m-%d %H:%M:%S"),
                  y = global_active_power,
                  type = "l",
                  xlab = "",
                  ylab = "Global Active Power (kilowatts)"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")
## Close the PNG device!
dev.off()