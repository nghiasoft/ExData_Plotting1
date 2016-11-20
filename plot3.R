library(data.table)
dtdata <- fread(input = "household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
names(dtdata) <- tolower(names(dtdata))
dtdata <- dtdata[, date:= as.Date(x = date, format = "%d/%m/%Y")]
dtdata <- dtdata[ date >= as.Date("2007-02-01") & date <= as.Date("2007-02-02"), ]

with(dtdata, plot(x  = as.POSIXct(paste(date, time),
                                  format="%Y-%m-%d %H:%M:%S"),
                  y = sub_metering_1,
                  type = "l",
                  xlab = "",
                  ylab = "Energy sub metering"))

with(dtdata, lines(x = as.POSIXct(paste(date, time),
                       format="%Y-%m-%d %H:%M:%S"),
      y = sub_metering_2, col = "red"))

with(dtdata, lines(x = as.POSIXct(paste(date, time),
                                  format="%Y-%m-%d %H:%M:%S"),
                   y = sub_metering_3, col = "blue"))

legend("topright", lwd = 2, cex = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png")
## Close the PNG device!
dev.off()