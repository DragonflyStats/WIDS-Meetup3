
# Countries and Species
# - deliberately making some "bad decisions".

Country <- data.frame(
  country = c("Spain","Italy","Nepal","Norway"),
  species = c("Setosa","Versicolor","Virginica","Norwegia")
)

#####
iris %>% head()
iris %>% names()   # potential problems ahead

####
iris %>% left_join(Country)   # Why does this not work?

iris %>% left_join(country,by=c("Species"="species")) %>% 
  head()                      # Why did this not work?

####

tolower("Kevin", "Oscar", "LouLou")

toupper("Kevin", "Oscar", "LouLou")

country$Species <- tolower(country$Species)

country <- country %>% mutate(Species = tolower(Species))


## Left SQL Join
iris %>% left_join(country,by=c("Species"="species")) %>%
  head()

