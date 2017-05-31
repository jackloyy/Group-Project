library(plotly)
library(dplyr)
library(shiny)

tourism.data <- read.csv('Data/JTM_inbound20170421eng.csv')

# Selects date(X) and country columns(X.11)

usa.data <- tourism.data %>% select(X, X.11)

# Creates dataset of annual visit
usa.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)
colnames(usa.annual) <- c("Years", "Total")

source("../Charts/Annual_Chart.R")

shinyServer(function(input, output) {
  
  output$linePlot <- renderPlotly({
    usa.annual.graph(input$year)
  })
  
})
