
install.packages("broom")
library(magrittr)
library(broom)

myModel <- lm(mpg~wt,data=mtcars)

MyModelSummary <- summary(myModel)

tidy(myModel)

MyModelSummary

class(myModelSummary)

mode(myModelSummary)

names(myModel)

signif(myModelSummary$r.squared,3)
