load_data <- function(start_date = '1/2/2007', end_date='2/2/2007'){
  
  # set the url and file names that will be used later
  data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zip_file <- "./data/exdata-data-household_power_consumption.zip"
  csv_file <- "household_power_consumption.txt"
  
  #create the data directory, if it doesn't exist
  if(!file.exists("data")){
    message("Creating data directory")
    dir.create("data")
  }
  
  #download the data file, if it doesn't exist
  if(!file.exists(zip_file)){
      message("Downloading data file. This will be done only once")
      download.file(data_url, destfile = zip_file, method="curl")
  }
  #read the data
  all_data = read.table(unz(zip_file,csv_file), header=T, sep=";", as.is=T, na.strings="?")
  
  #return the subset of the data that we are interested in 
  subset(all_data, Date== start_date | Date == end_date)
}