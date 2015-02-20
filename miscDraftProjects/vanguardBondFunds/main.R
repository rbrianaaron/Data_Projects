library(quantmod)
library(dplyr)
tickers = tickers.df$ticker
invisible(getSymbols(tickers))
close <- do.call(merge, lapply(tickers, function(x) Cl(get(x))))
close.df <- data.frame(close)

# note that you needed to add from to go beyond 2007
#getSymbols('VFIIX', from='1982-01-01')

#hist(VFIIX$VFIIX.Close, freq=TRUE)

# Note box plot did not work with quantmod data type
# It had to be changed to a dataframe
#x <- data.frame(VFIIX$VFIIX.Close)
#boxplot(x$VFIIX.Close)
#hist(x$VFIIX.Close)

#Just good to look at summarys
#print(summary(close))
# note to self negative indexing does not work in R
#most.recent <- last(close$VBILX)

#calculate the percentile rank for a given value using the custom formula: length(VAR[VAR <>
#in the sample, an age of 45 is at what percentile rank?
#length(Age[Age <= 45]) / length(Age) * 100

#version using quantmod classes
#length(close$VBILX[close$VBILX < as.numeric(last(close$VBILX))]) / length(close$VBILX)
#version using dataframe classes
#length(close.df$VBILX[close.df$VBILX < close.df$VBILX[length(close.df$VBILX)]]) / length(close.df$VBILX)

#Generic function
#percentile.rank <- function(x) {x[x < x[length(x)]] / length(x)}

percentile.rank <- function(x) {length(x[x < x[length(x)]]) / length(x)}
                                                                     
print(apply(close.df, 2, percentile.rank))


