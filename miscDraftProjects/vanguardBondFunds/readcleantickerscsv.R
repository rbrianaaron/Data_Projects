library(lubridate)
library(dplyr)

#reads a csv file of all of Vanguards bond funds
tickers.df <- read.csv('~\\Data_Projects\\vanguardBondFunds\\tickertitlespreadsheet.csv', stringsAsFactors=FALSE)

#cleans the inceptiondate column to remove other info
dates <- strsplit(tickers.df$inceptiondate, '\\(')
dates <- sapply(dates, function(x){x[2]})
dates <- gsub('\\)', '', dates )
tickers.df$inceptiondate <- dates

#cleans the name column
#new.name <- strsplit(tickers.df$name, '\n')
#new.name <- sapply(new.name, function(x){x[1]})

#converts inception date column to dates
tickers.df$inceptiondate <- mdy(tickers.df$inceptiondate)
year <- mdy(01032007)
tickers.df <- tickers.df[tickers.df$inceptiondate < year,]


