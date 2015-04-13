# Function to retrieve data from file
load_data <- function() {
    
  # loading datatable and lubridate libraries
  library(data.table)
  library(lubridate)
  
  # Read file in a data.table
  myData <- fread("household_power_consumption.txt", colClasses="character")
  
  # Format Date column
  myData[,Date:= parse_date_time(Date, "%d/%m/%Y")]
  
  # Get data of the two days period
  myData_Period <-  myData[Date %between% c("2007-02-01", "2007-02-03")]
  
  # Format DateTime and get rid of Date and Time columns
  myData_Period[,DateTime := paste(Date, Time), by = Date]
  myData_Period[, ':=' (DateTime = parse_date_time(DateTime, "%Y-%m-%d %T"), 
                        Date = NULL,                                    
                        Time = NULL)]
  
  # Convert other columns to numeric format
  myData_Period<- myData_Period[,lapply(.SD, as.numeric), by = DateTime]
  
  # return data
  return (myData_Period)
  
}