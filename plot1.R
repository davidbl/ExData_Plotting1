# load in the data reading code that is common to all 4 plots
source('load_data.R')

# function to draw the plot for the first assignment
drawPlot1 <- function(output_file_name = 'plot1.png') {
  message("loading data for Plot1")
  # load the data
  data = load_data()
  
  # explictly set the size of the png, even though those happen to be the defaults
  png(file=output_file_name, height=480, width=480, units = "px")
  
  #draw the plot
  hist(data$Global_active_power, col='red',main = 'Global Active Power',
       xlab = "Global Active Power (kilowatts)")
  #close the graphics device
  dev.off()
  
  #let the user know we are done
  message(paste("Plot output complete. Output written to file:", output_file_name))
}

message("call drawPlot1()  to draw the plot for the first assignment")