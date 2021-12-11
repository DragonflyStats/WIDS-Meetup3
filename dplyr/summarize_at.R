mtcars %>% 
  group_by(cyl, am) %>% 
  summarize_at(vars(disp, hp, mpg), funs(mean, sd))
