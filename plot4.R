library(data.table)
dtdata <- fread(input = "household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
names(dtdata) <- tolower(names(dtdata))
dtdata <- dtdata[, date:= as.Date(x = date, format = "%d/%m/%Y")]
dtdata <- dtdata[ date >= as.Date("2007-02-01") & date <= as.Date("2007-02-02"), ]

par(mfrow=c(2,2))

with(dtdata,
     ## plot 1
     plot(x  = as.POSIXct(paste(date, time),
                          format="%Y-%m-%d %H:%M:%S"),
          y = global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)")
    )
## plot 2
with(dtdata, plot(x  = as.POSIXct(paste(date, time),
                         format="%Y-%m-%d %H:%M:%S"),
         y = voltage,
         type = "l",
         xlab = "datetime",
         ylab = "Voltage")
    )

## plot 3
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
legend("topright", lwd = 1, cex = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot 4
with(dtdata, plot(x  = as.POSIXct(paste(date, time),
                         format="%Y-%m-%d %H:%M:%S"),
         y = global_reactive_power,
         type = "l",
         xlab = "datetime",
         ylab = "Global_reactive_power")
    )

## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png")
## Close the PNG device!
dev.off()