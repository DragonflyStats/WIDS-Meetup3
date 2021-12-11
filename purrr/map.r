mtcars %>% map(sum)


# * vector
mtcars %>% map_dbl(sum)

# If each element of the output is a data frame, use
# map_dfr to row-bind them together:

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .x)) %>%
  map_dfr(~ as.data.frame(t(as.matrix(coef(.)))))


iris %>%
  split(.$Species) %>%
  map(~ lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = .x)) %>%
  map_dfr(~ as.data.frame(t(as.matrix(coef(.)))))
