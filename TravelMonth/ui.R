library(shiny)
library(plotly)

# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Japan Travel data by month"),
    
    # Show a plot
    mainPanel(
       plotlyOutput("distPlot")
    )
  )
)
