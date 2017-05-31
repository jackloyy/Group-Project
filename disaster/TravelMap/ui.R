library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Earthquake map"),
    

    mainPanel(
       plotlyOutput("map")
    )
  )
)
