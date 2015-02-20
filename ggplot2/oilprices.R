# Install packages
library(jsonlite)
library(ggplot2)
# This data is from US Dept of Energy via quandl. It is the West Texas Intermediate Crude price
# per barrell
data <- fromJSON('http://www.quandl.com/api/v1/datasets/DOE/RWTC.json')
# The data came back as a list, so this place the data into a dataframe
df <- as.data.frame(data$data, stringsAsFactors=F)
# Change the types from character to data and numeric
df$V1 <- as.Date(df$V1)
df$V2 <- as.numeric(df$V2)
# Add appropriate column names
colnames(df) <- c('date', 'price')
# The first graph is a histogram to show the most common price since the beggining of the time
# series.
print(ggplot(data=df, aes(x=price)) + geom_bar(stat="bin") + 
        xlab("Price per barrel") +
        ggtitle("The most common WTI Crude price per barrel since 1985"))
# The second graph plots the prices by date
print(ggplot(data=df, aes(x=date, y=price)) + geom_line() + 
        ggtitle('WTI crude price per barrel since 1985'))