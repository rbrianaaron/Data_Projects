#Background
For a long time, I have been interested how bond funds fluctuate. They seem to fluctuate within a range. Over the long term, it seems to be rare for them to 
trend higher. Of course, due to bad management, for example high turnover, the net asset value(NAV), may decline or high fees may also deteriorate the NAV.

That said, I have had some succuss in buying bond funds at the bottom of their historical range in generating income and some captal gains. 
This may have been simply luck who knows.

In order to find more similar opportunities, I wanted to write a script that would take various types of bond funds and a number of years and return the percentile
value for each fund at the time of running the script for 5, 10, and 15 year time periods (I may want to pass time periods as well). 

Additionally, it would show the histograms and box plots for each fund type and show where the current price is on the histogram or boxplot. 

I could then run the script at anytime and get an immediate idea of what types of bonds were at the top, middle, or bottom of their historical price range. 

I'd also like to see what the 5, 10, 15 year median prices are and how close they are to current prices. 

Eventually, I'd like to develop such script for closed end bond funds, but to start I'll use the following Vanguard funds and tickers:


I choose Vanguard for the analysis because of the low costs (thus low damage to NAV), long price history, and variety of fundtypes. I might not choose to invest 
in the Vanguard fund, but it might be a good indicator of the bond fund type that is currently at the bottom of its range. 