# hms :  A simple class for storing time-of-day values

library(hms)

# Tidyverse Collection of R packages

library(magrittr)

# %>% pipe operator

# Input : Seconds, Minutes, then Hours

hms(56, 34, 12)

hms(56, 3
4, 12) %>% class

# No bounds checking is performed.

hms(56, 34, 36)

as.hms(1)

as.hms(1000)

as.hms(84000)

as.hms(90000)



as.hms("12:34:56")


Sys.time()

Sys.time() %>% class

as.hms(Sys.time())


Sys.time()

Sys.time() %>% class

as.hms(Sys.time())


as.POSIXct(hms(1))

data.frame(a = hms(1))



d <- data.frame(hours = 1:3)

d$hours <- hms(hours = d$hours)

d
