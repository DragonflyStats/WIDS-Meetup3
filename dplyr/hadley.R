library(dplyr)
library(tidyr)
library(readr)
library(nycflights13)
library(magrittr)

# Hadley's Model
# Transform - create new variables and new summaries
 
# 7 types of variable?
# Factor / String(Character) / Logical(boolean) ....
# ...date / integer / double / datetime

# Sum of logical vector - count of positive cases
# mean of logical vectors - proportion of positive cases

# NA - "Dont Know"

# how many missing values -> "sum(is.na(X))"

########################################
# NYC flights 
# flights  ( 336,776 x 16 )
# weather  (
# planes   (
# airports (
# airlines (
########################################
# Single Table Verbs
#  - filter,select , arrange, mutate, summarise
#  - also group_by
#  - view - nice scrollable table in Rstudio
########################################
#  Exercises
# 1. filter(flights, dest %in% c("SFO","OAK"))
# 2. filter(flights, month %in% c(1) )
#   2. filters(flights, month == 1)
# 3. filter(flights, dep_delay >120)
#    # Negative Values mean early departures
# 4. filter(flights, dep_time >0  & dep_time <500)
# 5. filter(flights, arr_delay > 2* dep_delay ) 
#########################################
# Part 2 - Select Exercises
# Select(df, -columnname)  - drops "columnname"
#########################################
# Write down three different ways to select the two delay variables 
#  - Ends With "dep"
#  - variables 5 and 7
#  - matchs a regular expression
#  
# select(flights, dep_delay, dep_delay+2) - not advised but interesting
#
# myVarList <- c("dep_delay","arr_delay")
# select(flights, one_of(myVarList) ) 

#########################################
# Part 3 - Arrange Exercises
# Order the flights by departure date and time
# which flights are the most delayes?
# Which flihts caught up the most time during the flight?
#   desc
arrange(flights, day, hour, time)
arrange(flights, desc(dep_delay-arr_delay)

#  NB - If a flight is cancelled - the departure time is missing
# How many flights were cancelled?
#########################################
# Part 4 - Mutate
# Compute Speed in mph from time (in minutes) and distances ( in miles)
# Which flight flew the fastest?
# Add a new variable that show how much time was made or lost in the flight?
# How did I compute hour and minutes from dep_time
# Hine - you may use View() to see the new variables
#########################################
transmute(flights , flighspeed = distance/(air_time/60) )
# Hot Air Balloons are slow

#  library(ggplot2)
#  ggplot( flights, aes(dep_time) ) + geoms_histogram(binwidth=10 )

c(513, 1345, 1204) %/% 100 # integer division
c(513, 1345, 1204) %% 100 # modulus 100

#  > c(513, 1345, 1204) %/% 100 # integer division
#  [1]  5 13 12
#  > c(513, 1345, 1204) %% 100 # modulus 100
#  [1] 13 45  4
#
# Other remarks
# Non Standard Evaluation vignette
# Variations of ST verbs - rename and transmute
# 
#################################################
 # Grouped Operations
 # group_by
 # Split Apply Combine paradigm

##################################################
# Summary
# n()
# n_distinct()
# mad()
#  you can also do things like "mean(x >10)"
#  This produces count and proportion variables


##################################################
by_date <- group(flights,month, day)

Missing Values - use the na.rm = T

delays <- summarize(by_date,
  n=n()
  
  mean = mean(dep_delay),
  median = median(dep_delay),
  q75 = quantile(dep_delay)
  over15 = mean(delay>15) # proportion f flight delayed by more than 15 minutes
 )

##################################################
# Exercises 
# which hour tha the highest average delay
# How many flights does each plane make (tail number)
# Compute the average(?) distance to each destination


by_plane <- group_by(flights,tailnum)
  summarise(by_plane,n=n() ) 

by_dest <- group_by(flights, dest)
summarise(by_dest,avg_distance=mean(distance))

###################################################
 # Data Pipelines
 # %>%

iris %>% summary


#################################################
#
# Which destinations have the highest average delay?
# on Average, how do delays (on non-cancelled flights) vary over the course of a day?
# Hint time = hour + minute/60 
# Use a plot

flights$dep_time %>% !is.na()


flights %>% 
   group_by(dest) %>% 
       summarise( n=n() , n-cancel = sum(is.na(arr_delay)), delay = arr_delays,na.rm=T) ) %>%
             arrange(desc(delays)) 


# Remove cancelled flights  -> fileter(!is.na (dep_delay) )
# Ten or more cases  -> filter(n>10)
 

# Plot these on a map? - Two table maps

###################################################

# Semi-joins
# Anti-joins
#####################################################
 

Are older planes more likely to be delayed?
 # What was weather like at nominal departure time (not actual departure time)
Explore the data and answer the data with a plit
(Hint: Start by checking some of the plane data)

myNewTBL <- left_join( flights, planes, by=c("tailnum"))

dim(myNewTBL)


summarise(by_buildyear, n=n(), meandelay =mean(dep_delay))



myNewTBL <- left_join( flights, planes, by=c("tailnum"))
dim(myNewTBL)
names(myNewTBL)
by_number = group_by(myNewTBL,tailnum)
summary(myNewTBL$year.x)
summary(myNewTBL$year.y)
rename(myNewTBL, buildyear = year.y)
by_number = group_by(myNewTBL,buildyear)
myNewTBL <- rename(myNewTBL, buildyear = year.y)
by_number = group_by(myNewTBL,buildyear)
by_buildyear = group_by(myNewTBL,buildyear)
summarise(by_buildyear, n=n(), meandepdelay =mean(dep_delay,na.rm=T), meanarrdelay =mean(arr_delay,na.rm=T) )  %>% arrange( desc(meandepdelay) )

