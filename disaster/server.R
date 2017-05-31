library(dplyr)
library(shiny)
library(plotly)

source("Annual_Chart.R")

shinyServer(function(input, output) {
  
  # Outputs html UI based on input's select value
  output$html <- renderUI( {
    if(input$select == 2011) {
      includeHTML("2011.html")
    } else if(input$select == 1995) {
      includeHTML("1995.html")
    }
  })

  # Outputs plot based on output's lineplot value
  output$LinePlot <- renderPlotly (
    if(input$select == 2011) {
      usa.annual.graph(2011)
    } else {
      usa.annual.graph(1995)
    }
  )
  
  
})
