library(shiny)
library(plotly)
library(dplyr)

source("earthquake_map.R")

shinyServer(function(input, output) {
    
    #Outputs an earthquake map
    output$map <- renderPlotly (
      earthquake.map()
    )
  
})
