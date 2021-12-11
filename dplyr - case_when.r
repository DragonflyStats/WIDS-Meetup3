
x <- 1:50
case_when(
x %% 35 == 0 ~ "fizz buzz",
x %% 5 == 0 ~ "fizz",
x %% 7 == 0 ~ "buzz",
TRUE ~ as.character(x)
)
# Like an if statement, the arguments are evaluated in order, so you must
# proceed from the most specific to the most general. This won't work:
case_when(
TRUE ~ as.character(x),
x %% 5 == 0 ~ "fizz",
x %% 7 == 0 ~ "buzz",
x %% 35 == 0 ~ "fizz buzz"
)


# case_when is particularly useful inside mutate when you want to
# create a new variable that relies on a complex combination of existing
# variables
starwars %>%
select(name:mass, gender, species) %>%
mutate(
type = case_when(
height > 200 | mass > 200 ~ "large",
species == "Droid" ~ "robot",
TRUE ~ "other"
    )
# Dots support splicing:
patterns <- list(
TRUE ~ as.character(x),
x %% 5 == 0 ~ "fizz",
x %% 7 == 0 ~ "buzz",
x %% 35 == 0 ~ "fizz buzz"
)
case_when(!!! patterns)
