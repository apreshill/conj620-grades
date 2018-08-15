library(tidyverse)
source("generate-fake.R")
set.seed(2018)

student_names <- read_csv("/Users/hillali/Box Sync/CONJ 620 Grades/sakai_tidy-2018-07-31.csv") %>% 
  select(name) %>% 
  distinct(name)

student_names <- student_names %>% 
  bind_cols(make_fake_name(nrow(student_names)))

sakai <- read_csv("/Users/hillali/Box Sync/CONJ 620 Grades/sakai_tidy-2018-07-31.csv") %>% 
  left_join(student_names) %>% 
  select(-name, -email) 
  
dc <- read_csv("/Users/hillali/Box Sync/CONJ 620 Grades/datacamp_tidy-2018-07-31.csv") %>% 
  left_join(student_names) %>% 
  select(-name, -email)

write_csv(student_names, "/Users/hillali/Box Sync/CONJ 620 Grades/name_key.csv")
write_csv(sakai, here::here("data", "sakai.csv"))
write_csv(dc, here::here("data", "dc.csv"))