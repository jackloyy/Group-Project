# Group Project
library(dplyr)

tourism.data <- read.csv('data/JTM_inbound20170421eng.csv')

# Select date(X) and country columns(X.11)
usa.data <- tourism.data %>% select(X, X.11)

# create dataset of monthly visit
usa.monthly <- usa.data %>% filter(row_number() >= 5, row_number() <= 259)

#creat dataset of annual visit
usa.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)