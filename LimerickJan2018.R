 # WIFI: ULwireless
 # Should be open access
 # 
 # While you are waiting : write down the addresses of places, you like
 sessionInfo()
library(tidyr)
# Google : CRAN 
# 
# install.packages("tidyverse")
# 1. Diva-GIS : get "shapefiles"
# 2. install.package called "sf"
#  - watch for quotations marks
# run this: 
# help(lm)
# help(apropos)
# ?iris
history()
iris
tail(iris)
# prints out last 6 lines of a "data.frame")
# %>% : pipe operator
iris %>% tail()
#install.packages("tidyverse")
 # try out theses
 # summary()
 # class()
 # mode()
 # head()
 # dim()
 # nrow()
 # ncol()
 # names()
iris %>% colnames()
# glimpse()
# library(tidyverse)
# %>%  : pipe operator (magrittr)
# library(magrittr)
head(iris,7)
summary(head(iris,7))
iris %>% head(7) %>% summary() 
# iris : inbuilt data set
# mtcars : another inbuild data set
# glimpse - command from "dplyr"
mtcars %>% glimpse()
library(dplyr)
mtcars %>% glimpse()
mtcars %>% glimpse()
# dplyr : main workhorse of data manipulation in tidyverse
# website: tidyverse.org
# select
# filter
mtcars %>% select(1:4) %>% head(5)
mtcars %>% select(1:hp) %>% head(5)
mtcars %>% select(hp:am) %>% head(5)
mtcars %>% select(hp:am, everything() ) %>% head(5)
iris %>% names()
iris %>% select( starts_with("Sepal") )  %>% head(5)
# Regular Expressions
iris %>% select( starts_with("[S|s]epal") )  %>% head(5)
iris %>% select( starts_with("Sepal") )  %>% head(5)
names("iris)
names("iris")
names(iris)
names(iris) %>% toupper
names(iris) %>% tolower
# names(iris) <- names(iris) %>% tolower
# names(iris) <- names(iris) %>% toupper
# grep
# gsub
# gsub : replaces a piece of text, with another piece of text
gsub(".","_",names(iris))
gsub("_",".",names(iris))
gsub(".","\_",names(iris))
gsub(".","",names(iris))
?gsub
iris %>% select( starts_with("S") )
iris %>% select( starts_with("S") ) %>% head(5)
# Ends with?
iris %>% select( contains("eta") ) %>% head(5)
iris %>% select( contains("eta") , everything()  ) %>% head(5)
iris %>% select( Species , contains("eta") , everything()  ) %>% head(5)
# filter
# selecting rows
# mtcars 
mtcars %>% filter(am==1) %>% head(6)
#
# " == " 
A <- 7  
# A is assigned the value &
# * assigned the value 7
A == 7
# A is equal to 7
# " = " is used for settings 
# col = "red"
mtcars %>% filter(am==1,vs==1) %>% head(6)
mtcars %>% filter(am != 1 ) %>% head(6)
# relational operators
# "==" equality
# " != " not equal to
# <, > greater than, less than
#<=
# >= 
cyl <- c(4,6)
cylset <- c(4,6)
class(cylset)
mode(cylset)
# numeric vector 
mtcars %>% filter(mpg>20,am==1) %>% head(5)
#set theory
# %in%   - "logical" - "is it a member of this set"
cylset 
5 %in% cylset
6 %in% cylset
mtcars %>% filter( cyl %in% cylset) %>% head(5)
# group_by : grouping operations
mtcars %>% group_by(am,vs) %>% summarize( mean(mpg) )
# iris, group_by "Species", mean of Sepal.Length
myReport <- mtcars %>% group_by(am,vs) %>% summarize( meanMpg = mean(mpg), sdMpg = sd(mpg) )
myReport
#tibble : tidyverse
#  - tidy tables
myReport <- mtcars %>% group_by(am,vs) %>% summarize( meanMpg = mean(mpg), sdMpg = sd(mpg) )
history(200)
myReport <- mtcars %>% 
        group_by(am,vs) %>% 
        summarize( meanMpg = mean(mpg), sdMpg = sd(mpg) )
# Tidyverse Style guide
myReports
myReport
data(midwest)
library(ggplot2)
data(midwest)
head(midwest)
table(midwest$state)
midwest %>% filter(state == "MI") 
midwest %>% filter(state == "MI") %>% arrange(rev(county))
midwest$state
midwest$state %>% table()
# Join
# create a dataframe
# statecodes
statecode <- c("IL","IN","MI","OH","WI")
statename <- c("Illinois","Indiana","Michigan","Ohio","Wisconsin")
class(statecode)
# factors
state <- data.frame(statename,statecode)
state
state$statename
state$statecode
glimpse(state)
state$statecode <- as.character(state$statecode)
glimpse(state)
glimpse(midwest)
glimpse(midwest[,1:10])
state$statecode <- as.character(state$statecode)
state$statename <- as.character(state$statename)
 #join tables 
 # left_join
 # inner_join
 # full_join
inner_join(midwest,state,by("state"=="statecode") )
# inner_join(midwest,state,by("state"=="statecode") )
midwest$state %>% head()
state$statecode %>% head()
# inner_join(midwest,state,by=c("state"=="statecode") )
inner_join(midwest,state,by=c("state"=="statecode") )
inner_join(midwest,state,by=c("state"="statecode") )
midwest2 <- inner_join(midwest,state,by=c("state"="statecode") )
midwest2 <- midwes2t2 %>% select(1:state,statename,everything() )
midwest2 <- midwest2 %>% select(1:state,statename,everything() )
midwest2 %>% head()
# install.package("sf")
# get USA zip file from DIVA-gis
getwd()
library(sf)
# setwd("C://myRproject")
# library called "here"
# Jenny Bryan blogpost about destroying your computer if you misued "setwd")
# sf - shapefiles
midwestmap <- sf::sf_read("USA_adm2.shp")
midwestmap <- sf::sf_read(choose.file())
counties <- sf::read_sf("IRL_adm1.shp")
counties <- sf::read_sf("USA_adm2.shp")
head(counties)
# setwd("C://myRproject")
# counties <- sf::read_sf("USA\USA_adm2.shp")
getwd()
# counties <- sf::read_sf("USA/USA_adm2.shp")
counties <- counties %>% select(ID_0,NAME_1:geomtery)
counties <- counties %>% select(ID_0,NAME_1:geometry)
counties <- counties %>% select(-ENGTYPE_2)
counties <- counties %>% select(-TYPE_2)
head(counties)
summary(counties$NL_NAME_2_
summary(counties$NL_NAME_2)
table(counties$NL_NAME_2)
counties <- counties %>% select(-NL_NAME_2)
table(counties$VARNAME_2)
counties$NAME_2[!is.na(counties$VARNAME_2)]
counties
midwest2
counties
list1 <-midwest$state
list1 <-midwest2$statename
list1
names(midwest2)
names(counties)
head(counties)
# 
inner_join(midwest2, counties, by = c("county" = "NAME_2", "statename" = "NAME_1"))
# inner_join(midwest2, counties, by = c("county" = "NAME_2", "statename" = "NAME_1"))
unique(midwest2$counties)
unique(midwest2$county)
unique(counties$NAME_2)
counties$NAME_2 <- toupper(counties$NAME_2)
unique(counties$NAME_2)
counties$NAME_2 <- toupper(counties$NAME_2)
# unique(counties$NAME_2)
# inner_join(midwest2, counties, by = c("county" = "NAME_2", "statename" = "NAME_1"))
inner_join(midwest2, counties, by = c("county" = "NAME_2", "statename" = "NAME_1"))
anti_join(midwest2, counties, by = c("county" = "NAME_2", "statename" = "NAME_1"))
anti_join(counties, midwest2, by = c("county" = "NAME_2", "statename" = "NAME_1"))
anti_join(counties, midwest2, by = c("NAME_2" = "county","NAME_1" = "statename"))
anti_join(counties, midwest2, by = c("NAME_2" = "county","NAME_1" = "statename")) %>% filter(NAME_1 %in% c("Michigan"))
# inner_join(midwest2, counties, by = c("county" = "NAME_2", "statename" = "NAME_1"))
midwest <- inner_join(midwest2, counties, by = c("county" = "NAME_2", "statename" = "NAME_1"))
# Coming Soon to R
ggplot(midwest) + geom_sf()
ggplot(counties) + geom_sf()
download.file("http://biogeo.ucdavis.edu/data/diva/adm/IRL_adm.zip",
   destfile = "counties.zip")
unzip("counties.zip")
counties <- sf::read_sf("IRL_adm1.shp")
ggplot(counties)+geom_sf()
ggplot(midwest2) + geom_sf()
MW3 <-  inner_join(midwest2, counties, by = c("county" = "NAME_2", "statename" = "NAME_1"))
midwest2
#install.github
#install.packages("ggmpa")
#install.packages("ggmap")
library(ggmap)
geocode("Kavanagh's Pub, Glasnevin, Dublin")
get_map("Kavanagh's Pub, Glasnevin, Dublin")
get_map("Kavanagh's Pub, Glasnevin, Dublin") %>% ggmap()
get_map("Kavanagh's Pub, Glasnevin, Dublin") %>% ggmap(zoom=16)
get_map("Kavanagh's Pub, Glasnevin, Dublin") %>% ggmap(zoom=16)
get_map("Kavanagh's Pub, Glasnevin, Dublin",zoom=16) %>% ggmap()
get_map("The Curragower, Clancy Strand, Limerick",zoom=16) %>% ggmap()
get_map("The Curragower, Clancy Strand, Limerick",zoom=16) %>% ggmap()
get_map("The Curragower Bar, Limerick",zoom=16) %>% ggmap()
get_map("Clancy Strand, Limerick",zoom=16) %>% ggmap()
get_map("Clancy Strand, Limerick",zoom=16) %>% ggmap()
# fit a statistical model to some data
 library(modelr)
 library(broom)
# install.package("broom")
lm( cyl ~ wt , data = mtcars)
mymodel <- lm( cyl ~ wt , data = mtcars)
# broom
tidy(mymodel)
summary(mymodel)
mytidymodel <- tidy(mymodel)
mytidymodel$p.values
mytidymodel$p.value
mymodel <- lm( cyl ~ wt , data = mtcars)
mytidymodel <- tidy(mymodel)
mytidymodel
mytidymodel$p.value
mytidymodel$estimate
# that is from broom
# from modelr
rmse(mymodel)
RMSE(mymodel)
library(modelr)
#install.packages("modelr")
RMSE(mymodel)
rmse(mymodel)
rmse(mymodel,mtcars)
rsquare(mymodel,mtcars)
mae(mymodel,mtcars)
data(diamonds)
head(diamonds)
# price
# in this instance - only use numeric variables
# divide the data into 2 parts
# - Training 
# - Testing 
# - Training : 0.30
# - Testing : 0.10
# dplyr
diamtrain <- diamonds %>% sample_frac(0.3)
diamtest  <- diamonds %>% sample_frac(0.1)
# CRUDE WAY OF DOING THIS
# Other packages have better ways of "partitioning"
# set.seed(1234)
# set.seed()
# fit model using diamtrain
lm(price ~ cut + x + y + z, data=diamtrain)
lm(price ~ ., data=diamtrain)
diammodel <- lm(price ~ ., data=diamtrain)
# fit model using diamtrain
rsquare(diammodel,diamtrain)
rsquare(diammodel,diamtest)
rmse(diammodel,diamtest)
rmse(diammodel,diamtrain)
mae(diammodel,diamtrain)
iris
iris$Species %>% table()
# binary variables
# 3 binary variables
# modelr
# model_matrix
# "one hot encoding"
# ML Hipsters
model_matrix(Species ~ Sepal.Length)
iris %>% model_matrix(Species ~ Sepal.Length)
iris %>% model_matrix(Species ~ Sepal.Length-1)
iris %>% model_matrix(Sepal.Length ~ Species-1)
#modelr
#broom
https://github.com/RWorkshop/moretidyverse/blob/master/readr/read_csv.R
# Old Way / Base R
GE1 <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/GEdata.csv")
# New Way / Tidyverse
library(readr)
GE2 <- read_csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/GEdata.csv")
# What is the Difference?
glimpse(GE1)
glimpse(GE2)
GE2$Date
GE2$Date %>% class()
# data.table
# fread() - fastread
# - haven
# - readxl
# lubridate
library(lubridate)
year(GE$Date)
year(GE2$Date)
# year(GE$Date)
# library(lubridate)
head(GE2$Date)
head(GE2$Date) %>% year()
head(GE2$Date) %>% month()
# dplyr
# one more verb for "dplyr"
# tidyverse
head(GE2)
GE2  %>% mutate( year = year(GE2$Date) )    %>% head(5)
GE2  %>% mutate( year = year(GE2$Date) ,month = month(GE2$Date) )    %>% head(5)
GE2  %>% mutate( year = year(GE2$Date) ,month = month(GE2$Date), day = wkay(GE2$Date) )    %>% head(5)
GE2  %>% mutate( year = year(GE2$Date) ,month = month(GE2$Date), day = wday(GE2$Date) )    %>% head(5)
GE2  %>% mutate( year = year(GE2$Date) ,month = month(GE2$Date), day = wday(GE2$Date,label=TRUE) )    %>% head(5)
 GE2  %>% mutate( year = year(GE2$Date) ,
                  month = month(GE2$Date), 
                 day = wday(GE2$Date,label=TRUE) #
      )    %>% head(5)
month = month(GE2$Date,label=TRUE) #
month
 GE2  %>% mutate( year = year(GE2$Date) ,
                  month = month(GE2$Date,label=TRUE), 
                 day = wday(GE2$Date,label=TRUE) 
      )    %>% head(5)
GE2 %>% mutate( Diff  = Close - Open) 
# mutate(GE2, Diff  = Close - Open) 
GE2 %>% mutate( Diff  = Close - Open, UP = sign(Diff) ) 
history(500)

