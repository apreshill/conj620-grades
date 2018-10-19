library(tidyverse)
source("generate-fake.R")
set.seed(2018)

student_names <- read_csv("/Users/alison/Box Sync/CONJ 620 Grades/2018-10-18_lab-grades-tidy.csv") %>% 
  select(name) %>% 
  distinct(name)

student_names <- student_names %>% 
  bind_cols(make_fake_name(nrow(student_names)))

sakai <- read_csv("/Users/alison/Box Sync/CONJ 620 Grades/2018-10-18_lab-grades-tidy.csv") %>% 
  left_join(student_names) %>% 
  select(-name, -email) 
  
dc <- read_csv("/Users/alison/Box Sync/CONJ 620 Grades/2018-10-18_datacamp-grades-tidy.csv") %>% 
  left_join(student_names) %>% 
  select(-name, -email)

#write_csv(student_names, "/Users/hillali/Box Sync/CONJ 620 Grades/name_key.csv")
write_csv(sakai, here::here("data", "sakai.csv"))
write_csv(dc, here::here("data", "dc.csv"))
