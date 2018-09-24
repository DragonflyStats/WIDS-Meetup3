

A <- "00\XX23"
B <- "00-XX23"
C <- "00_XX23"


#########################

# install.packages("dtplyr")

# library(dtplyr)




library(tidyverse) # Remember!

library(data.table)

library(tibble)
library(dplyr)
library(magrittr)



dtA <- data.table(ID = letters[1:5], x1 = 1:5, x2 = (2:6)^2)


setkey(dtA,ID)




dtB <- data.table(ID = letters[3:7], y1 = 1:5, y2 = sqrt(2:6))


setkey(dtB,ID)





dtA[dtB] %>% print



dtB[dtA] %>% print


dtA.tbl  = as.tibble(dtA)


dtB.tbl  = as.tibble(dtB)


anti_join(dtA.tbl,dtB.tbl)




