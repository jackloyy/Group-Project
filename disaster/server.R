library(dplyr)
library(shiny)
library(plotly)
library(shinydashboard)

tourism.data <- read.csv('Data/JTM_inbound20170421eng.csv', stringsAsFactors=FALSE)

# Select date(X) and country columns(X.11)
usa.data <- tourism.data %>% select(X, X.11)

# Creates dataset of monthly visits
usa.monthly <- usa.data %>% filter(row_number() >= 5, row_number() <= 256) %>% mutate(Years = as.integer(1996 + ((row_number() - 1) / 12)))
colnames(usa.monthly) <- c("Months", "Total", "Years")
# Removes years from Months column
i <- 1
while(i < nrow(usa.monthly)) {
  usa.monthly$Months[i] = "Jan．"
  i = i + 12;
}
# Change value to match up with the rest from the same column
usa.monthly$Months[46] = "Oct．"

# Creates dataset of annual visits (1996 - 2016)
usa.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)
colnames(usa.annual) <- c("Years", "Total")


# Displays a chart given a dataset of monthly data and a year
usa.month.chart <- function(data.month, year) {
  monthly.data <- data.month %>% filter(Years == year)
  # Stores and chops off the commas in the numbers
  total <- as.numeric(gsub(",", "", monthly.data$Total));
  # Stores and arranges the months in chronological order
  months <- factor(monthly.data$Months, levels = c("Jan．", "Feb．", "Mar．", "Apr．", "May．", "Jun．", "Jul．", "Aug．", "Sep．", "Oct．", "Nov．", "Dec．"))
  # Display chart based on visits per month
  monthly.chart <- plot_ly(monthly.data, x = ~months, y = ~total, type = 'scatter', mode = 'lines') %>% layout(title = paste("Monthly Visits from US in", year))
  return (monthly.chart)
}

usa.annual.graph <- function(data.annual, year) {
  
  graph.data <- data.annual %>% filter(Years == year - 1 | Years == year - 2 | Years == year + 1 | Years == year + 2) 
  # Stores and chops off the commas in the numbers
  total <- as.numeric(gsub(",", "", graph.data$Total));
  #create a yearly chart
  Yearly.chart <- plot_ly(graph.data, x = ~Years, y = ~total, type = 'scatter', mode = 'lines', color = 'red') %>% 
    layout(title = paste("Yearly Visits from US in", year))
  
  Yearly.chart
  
}


shinyServer(function(input, output) {

  output$LinePlot <- renderPlot({
  
      if(input$select == 1) {
       usa.month.chart(usa.monthly, 2011)
       #usa.annual.graph(usa.annual, 2011)
      } else {
        usa.month.chart(usa.monthly, 1995)
       # usa.annual.graph(usa.annual,1995)
      }
    
  })
  
})
