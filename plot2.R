# load in the data reading code that is common to all 4 plots
source('load_data.R')

# function to draw the plot for the second assignment
drawPlot2 <- function(output_file_name = 'plot2.png') {
  message("loading data for Plot2")
  # load the data
  data = load_data()
  
  #create the time series
  times =strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
  values = data$Global_active_power
  
  # explictly set the size of the png, even though those happen to be the defaults
  png(file=output_file_name, height=480, width=480, units = "px")
  
  #draw the plot
  plot(times,values, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(times,values)
 
  #close the graphics device
  dev.off()
  
  #let the user know we are done
  message(paste("Plot output complete. Output written to file:", output_file_name))
}

message("call drawPlot2()  to draw the plot for the second assignment")