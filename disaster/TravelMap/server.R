library(shiny)
library(plotly)
library(dplyr)

source("earthquake_map.R")

shinyServer(function(input, output) {
    
    output$map <- renderPlotly (
      earthquake.map()
    )
  
})
