
library(dplyr)
library(magrittr)

# var 1 : original data
var1 <- sample(c(rep(NA,15),sample(1:10,15,T)))

# var 2 : copy of var 1 that we want to update
var2 <- var1

# var 3 : update NAs with these values 
var3 <- sample(1:10,30,T)

myDF <- data.frame(var1,var2,var3)

head(myDF)

# glimpse(myDF)
# all columns are class integer.

myDF %>% mutate(var2 = coalesce(var2,0L)) %>% head

myDF %>% mutate(var2 = coalesce(var2,var3)) %>% head

set.seed(1)
mtcars2<-mtcars
mtcars2[sample(1:dim(mtcars)[1], 5),
       sample(1:dim(mtcars)[2], 5)] <-  NA



mtcars2 %>% select(vs) %>%   mutate_if(is.na,vs2=0)



mtcars2 %>% head
