library(plotly)
library(ggplot2)
library(dplyr)

tourism.data <- read.csv('data/JTM_inbound20170421eng.csv')

# Select date(X) and country columns(X.11)
usa.data <- tourism.data %>% select(X, X.11)

#creat dataset of annual visit
usa.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)
colnames(usa.annual) <- c("Years", "Total")


usa.annual.graph <- function(data.annual, year) {
  
  graph.data <- data.annual %>% filter(Years == year - 1 | Years == year - 2 | Years == year + 1 | Years == year + 2 | Years == year) 
  # Stores and chops off the commas in the numbers
  total <- as.numeric(gsub(",", "", graph.data$Total));
  #create a yearly chart
  Yearly.chart <- plot_ly(graph.data, x = ~Years, y = ~total, type = 'scatter', mode = 'lines', color = 'red') %>% 
    layout(title = paste("Annualy Visits from US in", year))
  
 return(Yearly.chart)
}


