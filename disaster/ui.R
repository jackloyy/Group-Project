
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Natural Disaster related"),
  
  selectInput("select", label = h2("Select Natural disaster"), 
              choices = list("2011 Earthquake" = 1, "1995 Earthquake" = 2), 
              selected = 1),
  
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("LinePlot")
    )
  )
)
