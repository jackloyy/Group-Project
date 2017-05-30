
library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Earthquake map"),
    

    mainPanel(
       plotlyOutput("map")
    )
  )
)
