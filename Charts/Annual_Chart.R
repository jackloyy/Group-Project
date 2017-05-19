library(plotly)

# Group Project
library(dplyr)

tourism.data <- read.csv('data/JTM_inbound20170421eng.csv')

# Select date(X) and country columns(X.11)
usa.data <- tourism.data %>% select(X, X.11)

#creat dataset of annual visit
usa.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)
colnames(usa.annual) <- c("Years", "Total")
View(usa.annual)

usa.annual.graph <- function(data.annual) {

  
  
  
  x <- c(1990:2016)
  y <- rnorm(data.annual$Total, mean = 70000)
  data <- data.frame(x, y)
  
  p <- plot_ly(data, x = ~x, y = ~y, type = 'scatter', mode = 'lines')
  
  p
}

usa.annual.graph(usa.annual)