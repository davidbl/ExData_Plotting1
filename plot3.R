# load in the data reading code that is common to all 4 plots
source('load_data.R')

# function to draw the plot for the third assignment
drawPlot3 <- function(output_file_name = 'plot3.png') {
  message("loading data for Plot3")
  # load the data
  data = load_data()
  
  #create the time series
  times =strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
  values_1 = data$Sub_metering_1
  values_2 = data$Sub_metering_2
  values_3 = data$Sub_metering_3
  
  # explictly set the size of the png, even though those happen to be the defaults
  png(file=output_file_name, height=480, width=480, units = "px")
  
  #draw the plot
  plot(times,values_1, type="n", xlab = "", ylab = "Energy sub metering")
  lines(times,values_1, col = "black")
  lines(times,values_2, col = "red")
  lines(times,values_3, col = "blue")
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = c(1,1,1),
         lwd = c(1,1,1),
         col = c("black", "red", "blue"))
  
 
  #close the graphics device
  dev.off()
  
  #let the user know we are done
  message(paste("Plot output complete. Output written to file:", output_file_name))
}

message("call drawPlot3()  to draw the plot for the third assignment")