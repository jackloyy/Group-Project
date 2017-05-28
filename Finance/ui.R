library(plotly)
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Finance factors related"),
  
  selectInput("select", label = h2("Select Finance type"), 
              choices = list("currency" = 1, "income" = 2), 
              selected = 1),
  
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("LinePlot")
  )
)
)