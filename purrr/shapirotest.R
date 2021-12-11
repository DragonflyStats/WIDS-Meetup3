library(purrr)    # "map" and "map_dbl"
library(dplyr)    # "select"
library(magrittr) # %>%
library(broom)    # "tidy"
 
library(mlbench)
data(Sonar)


# sixty Number Variables : "V1" to "V60"


summary(Sonar$V47)

shapiro.test(Sonar$V47)

shapiro.test(log(Sonar$V47))


Sonar %>% select(1:60) %>% 
          map(shapiro.test)

Sonar %>% select(1:60) %>% 
          map(shapiro.test) %>% 
          map(tidy)

Tests <- Sonar %>% select(1:60) %>% 
          map(shapiro.test) %>% 
          map(tidy) %>% 
          map_dbl("p.value")

Test2 <- Sonar %>% select(1:60) %>% 
          map(log) %>% 
          map(shapiro.test) %>% 
          map(tidy) %>% 
          map_dbl("p.value")
