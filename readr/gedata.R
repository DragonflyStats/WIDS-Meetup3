library(readr)
read_csv("GE.csv")
GE = read_csv("GE.csv")
GE
GE$Date <- dmy(GE$Date)
GE
GE = read_csv("GEData.csv")
dim(GE)
head(GE)
tail(GE)
GE$Date <- ymd(GE$Date)
GE <- GE %>% mutate( year = year(Date))
library(dplyr)
GE <- GE %>% mutate( year = year(Date))
GE
GE <- GE %>% mutate( month = month(Date))
GE <- GE %>% mutate( day = day(Date))
GE
GE
GE <- GE %>% mutate( wday = wday(Date.label=T))
GE <- GE %>% mutate( wday = wday(Date,label=T))
GE
