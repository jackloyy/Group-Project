library(plotly)
library(ggplot2)
library(dplyr)

usa.annual.graph <- function(year) {
  tourism.data <- read.csv('../Data/JTM_inbound20170421eng.csv', stringsAsFactors=FALSE)
  # Select date(X) and country columns(X.11)
  usa.data <- tourism.data %>% select(X, X.11)
  # Creates dataset of annual visits (1996 - 2016)
  data.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)
  colnames(data.annual) <- c("Years", "Total")
  graph.data <- data.annual %>% filter(Years == year - 1 | Years == year - 2 | Years == year + 1 | Years == year + 2 | Years == year) 
  # Stores and chops off the commas in the numbers
  total <- as.numeric(gsub(",", "", graph.data$Total));
  #create a yearly chart
  Yearly.chart <- plot_ly(graph.data, x = ~Years, y = ~total, type = 'scatter', mode = 'lines', color = 'red') %>% 
    layout(title = paste("Annualy Visits from US in", year))
  
 return(Yearly.chart)
}


