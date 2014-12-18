beststates <- function(){
        #The function will return the top five and bottom five states for 30 day moratality rates
        #for heart attack patients.
        #
        #Args:
        #  None. The dataset is the OutcomeofCareMeasures.csv file taken fromt the Medicare.gov
        #  website. It can be downloaded at: https://data.medicare.gov/data/hospital-compare
        #
        #Returns:
        #
        #  The top five and bottom five states for the 30 day mortality rates for heart attack
        #  patients and the number of hospitals in that state that had measurements for the
        #  statistics. Hosptials with NA data will be excluded.
        
        #Load the data into the data variable.
        data <- read.csv('OutcomeofCareMeasures2014.csv')
        
        #Coerce factors as neccesary to ensure states are characters and the 30 day stats are numeric.
        data[,2] <- as.character(data[,2])  #Hospital Name
        data[,7] <- as.character(data[,7])  #State
        suppressWarnings(data[,11] <- as.numeric(as.character(data[,11])))  #30-day mortality
        
        #Remove the hospitals that have NA for 30-day mortality rate for heart attack.
        data <- subset(data, !is.na(data[,11]))
        
        #Split data by state, take the mean of the 30-day mortality data, 
        #and return averages to averages vector
        averages <- tapply(data[,11], data[,7], mean)
        states <- dimnames(averages)  #Place state abbreviations in states vector.
        averages <- as.vector(averages)
        
        #Count the hospitals per state and return it to the number_hosptals vector.
        number_hospitals <- tapply(data[,2], data[,7], length)
        number_hospitals <- as.vector(number_hospitals)
        
        #Combine the vectors into a dataframe.
        data_final <- data.frame(states, averages, number_hospitals)
        names(data_final) <- c('States', '30-day mortality heart attack', 'Number of Hospitals')
        
        #Sort the dataframe by the average 30 day mortality scores
        data_final <- data_final[order(data_final[, 2]), ]
        
        #Print out the first and last five states in the dataframe.
        print(head(data_final), 5)
        print(tail(data_final), 5)
                
}