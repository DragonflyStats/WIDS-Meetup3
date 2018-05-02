
library(dplyr)
library(magrittr)

mtcars2 <- mtcars
mtcars2[sample(1:dim(mtcars)[1], 5),
       sample(1:dim(mtcars)[2], 5)] <-  NA



mtcars2 %>% 
    mutate_if(is.na,0)




mtcars2 %>% 
    mutate_if(is.na, funs(. = 0))
