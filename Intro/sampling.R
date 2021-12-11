
library(magrittr)


MyPop <- rnorm(100000,100,15) %>% round(2)



MyPop[1:100]

RollDie <- sample(1:6,100,replace=TRUE)

RollDie

mySamp <- sample(MyPop,20)

mySamp

mean(mySamp)

sort(mySamp)

median(mySamp)

range(mySamp)

var(mySamp)

sd(mySamp)
