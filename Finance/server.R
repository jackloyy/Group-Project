library(dplyr)
library(shiny)
library(plotly)


source("Financ_Annual_Chart.R")

shinyServer(function(input, output) {
  
  output$html <- renderUI( {
    if(input$select == 1) {
      includeHTML("2015.html")
    } else if(input$select == 2) {
      includeHTML("2008.html")
    }
  })
  
  output$LinePlot <- renderPlotly({
    
    if(input$select == 1) {
      financial.annual.chart("currency")
    } else {
      financial.annual.chart("income")
    }
    
  })
  
})