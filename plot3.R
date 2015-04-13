# get Data
source("ExData_Plotting1/load_data.R")
myData_Period <- load_data()


# Plots Constants
PlotWidth         <- 480
PlotHeight        <- 480
PlotUnits         <- "px"
PlotBg            <- "white"
PlotFileName      <- "./ExData_Plotting1/plot3.png"

MarginBottom      <- 8
MarginLeft        <- 8
MarginTop         <- 7
MarginRight       <- 6

PlotLinesColor2   <- "blue"
PlotLinesColor    <- "red"
PlotColsColor     <- "black"
PlotTitle         <- "Global Active Power"
PlotXLabel        <- ""
PlotYLabel        <- "Energy sub metering"


#Graphical Device is PNG
png(filename = PlotFileName , width = PlotWidth, height = PlotHeight, units = PlotUnits, bg = PlotBg)

# Graphical margins
par(mar = c(MarginBottom, MarginLeft, MarginTop, MarginRight))


# Graphic Plot
plot(myData_Period$DateTime, myData_Period$Sub_metering_1, col = PlotColsColor,
     type="l",
     xlab=PlotXLabel,
     ylab=PlotYLabel)

lines(myData_Period$DateTime, myData_Period$Sub_metering_2, col=PlotLinesColor)
lines(myData_Period$DateTime, myData_Period$Sub_metering_3, col=PlotLinesColor2)
legend("topright",col=c("black", "red", "blue"), c("Sub_metering_1", 
                                                   "Sub_metering_2", "Sub_metering_3"), lty=1)

# Close Graphical device
dev.off()

