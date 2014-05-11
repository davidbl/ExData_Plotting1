# load in the data reading code that is common to all 4 plots
source('load_data.R')

# function to draw the plot for the fourth assignment
drawPlot4 <- function(output_file_name = 'plot4.png') {
  message("loading data for Plot4")
  # load the data
  data = load_data()
  
  #create the time series
  datetime =strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
  
  # explictly set the size of the png, even though those happen to be the defaults
  png(file=output_file_name, height=480, width=480, units = "px")
  
  #set up the four plots
  par(mfrow = c(2,2))
  
  #draw the first plot
  values_plot1 = data$Global_active_power
  plot(datetime,values_plot1, type="n", xlab = "", ylab = "Global Active Power")
  lines(datetime,values_plot1)
  
  #draw the second plot
  values_plot2 = data$Voltage
  plot(datetime,values_plot2, type="n", ylab = 'Voltage' )
  lines(datetime,values_plot2)
  
  #draw the third plot
  values_1 = data$Sub_metering_1
  values_2 = data$Sub_metering_2
  values_3 = data$Sub_metering_3
  plot(datetime,values_1, type="n", xlab = "", ylab = "Energy sub metering")
  lines(datetime,values_1, col = "black")
  lines(datetime,values_2, col = "red")
  lines(datetime,values_3, col = "blue")
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bty = "n",
         lty = c(1,1,1),
         lwd = c(1,1,1),
         col = c("black", "red", "blue"))
  
  #draw the fourth plot
  values_plot3 = data$Global_reactive_power
  plot(datetime, values_plot3, ylab="Global_reactive_power", type="n")
  lines(datetime, values_plot3)
  
  #close the graphics device
  dev.off()
  
  #let the user know we are done
  message(paste("Plot output complete. Output written to file:", output_file_name))
}

message("call drawPlot4()  to draw the plot for the fourth assignment")