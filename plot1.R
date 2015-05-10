# get Data
source("ExData_Plotting1/load_data.R")
if (!exists("myData_Period")) {myData_Period <- load_data()}


# Plots Constants
PlotWidth         <- 480
PlotHeight        <- 480
PlotUnits         <- "px"
PlotBg            <- "transparent"
PlotFileName      <- "./ExData_Plotting1/plot1.png"

MarginBottom      <- 8
MarginLeft        <- 8
MarginTop         <- 7
MarginRight       <- 6

PlotColsColor     <- "red"
PlotTitle         <- "Global Active Power"
PlotXLabel        <- "Global Active Power(kilowatts)"

#Graphical Device is PNG
png(filename = PlotFileName , width = PlotWidth, height = PlotHeight, units = PlotUnits, bg = PlotBg)

# Graphical margins
par(mar = c(MarginBottom, MarginLeft, MarginTop, MarginRight))

# Graphic Plot
hist(myData_Period$Global_active_power, col = PlotColsColor, main = PlotTitle, xlab = PlotXLabel)

# Close Graphical device
dev.off()
