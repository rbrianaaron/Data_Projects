#Import libraries
library(XML)
library(dplyr)
library(zoo)

#Gather data, first gather the distribution history
url <- 'http://www.wisdomtree.com/etfs/recent-distributions-history.aspx?etfid=50'
distributionTable <- readHTMLTable(url, which=1, stringsAsFactors=FALSE)

#Convert dates to dates, remove all columsn except total distribution b/c there were no cap 
# gap gains to account for.
distributionTable <- select(distributionTable, payableDate=starts_with('Payable'), totalDistribution=starts_with('Total'))
distributionTable$payableDate <- mdy(distributionTable$payableDate)
distributionTable$totalDistribution <- gsub("\\$", "", distributionTable$totalDistribution)
distributionTable$totalDistribution <- as.numeric(distributionTable$totalDistribution)


#Gather price data

# Add a column for the year of the distribution inorder to group distributions by year
distributionTable$payableYear <- year(distributionTable$payableDate)
distributionByYear <- distributionTable %>%
        group_by(payableYear) %>%
        summarise(distributionByYear=sum(totalDistribution))%>%
        mutate(currentPrice=39.4, yield=distributionByYear/currentPrice)

#Add a rolling mean column to distributionTable
distributionTable$rollingDistributionSum <- rollsum(x=distributionTable$totalDistribution, k=4, fill=NA, align='left')
