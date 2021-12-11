install.packages("nycflights13")
library(nycflights13)

# airlines                Airline names.
# airports                Airport metadata
# flights                 Flights data
# planes                  Plane metadata.
# weather                 Hourly weather data

###################################

library(dplyr)
library(magrittr) # %>%
library(broom)

###################################

# 1. Reverse the sorting order with minus

# We can use minus ‘-’ function to reverse the order for ‘arrange’, ‘top_n’, and ‘nth’ 
# functions.

flights %>% arrange(-arr_delay) %>% head(10)


# Equivalently


flights %>% arrange( desc(arr_delay) ) %>% head(10)
###################################
# 2. top "n"
 
# Suppose we want to get the top 10 flights based on ‘arr_delay’ column values. 
# We can use ‘top_n’ function like below.


# Will include ties - so may get more than "n" rows in output

flights %>% top_n(10, arr_delay)


# bottom 'n'

flights %>% top_n(-10, arr_delay)

###################################

