
# Run once, then comment out
install.packages("broom")

library(magrittr)

library(broom)

lm(mpg ~ wt + cyl, data=mtcars)

myModel <- lm(mpg ~ wt + cyl, data=mtcars)
summary(myModel)

tidy(myModel)

myTidyModel <- tidy(myModel)

class(myTidyModel)

names(myTidyModel)

myTidyModel$p.value %>% round(4)

myModel <- lm(mpg ~ wt+cyl, mtcars)
augment(myModel)


glance(myModel)



kmeans(iris[,1:4],3 )

KMmodel <- kmeans(iris[,1:4],3 )
summary(KMmodel)

tidy(KMmodel)

# augment(Model,Data)

augment(KMmodel,iris[,1:4]) %>%head()

glance(KMmodel)
