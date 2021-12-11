library(tidyverse)
files <- list.files("../open-data/", pattern = "^2017", full.names = TRUE)
full <- map_df(files, read_csv)
dplyr::glimpse(full)

# With names 

files <- list.files("../open-data/", pattern = "^2017", full.names = TRUE) %>% 
  set_names(basename(.))
full <- map_df(files, read_csv, .id = "file")
