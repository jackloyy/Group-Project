library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Earthquake map"),
    
    # Outputs a map using plotly
    mainPanel(
       plotlyOutput("map")
    )
  )
)
