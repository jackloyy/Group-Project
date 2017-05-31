library(shiny)
library(dplyr)
library(plotly)

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

source("../Charts/Cum_Monthly_Chart.R")

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlotly({
    cum.month.chart(usa.monthly)
  })
  
})
