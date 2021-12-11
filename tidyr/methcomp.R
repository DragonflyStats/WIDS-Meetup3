library(MethComp)

data(ox)

head(ox)

###########################################

data(fat)

head(fat) 

###########################################

# "Gather" by everthing you want
# new names : Meth and y
# values : Sub, Vic

fat %>% gather( Meth, y, c(Sub,Vic)) %>% head

# Or everything you dont want!

fat2 <- fat %>% gather( Meth, y, -c(Id,Obs, Rep)) %>% head

head(fat2)
