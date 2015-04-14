# Function to retrieve data from file
load_data <- function() {
    
  # loading datatable and lubridate libraries
  library(data.table)
  library(lubridate)
  
  # Read file in a data.table
  myData <- fread("household_power_consumption.txt", colClasses="character")
  
  # Get data of the two days period
  myData_Period <-  myData[Date %in% c("1/2/2007", "2/2/2007")]
  
  # Format DateTime and get rid of Date and Time columns
  myData_Period[,DateTime := paste(Date, Time)]
  myData_Period[, ':=' (DateTime = parse_date_time(DateTime, "%d-%m-%Y %T"), 
                        Date = NULL,                                    
                        Time = NULL)]
  
  # Convert other columns to numeric format
  myData_Period<- myData_Period[,lapply(.SD, as.numeric), by = DateTime]
  
  # Return data
  return (myData_Period)
  
}

