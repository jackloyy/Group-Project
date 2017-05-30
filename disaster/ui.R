
library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Natural Disaster related"),
  

  column(4, wellPanel(selectInput("select", label = h2("Select Natural disaster"), 
              choices = list("2011 Earthquake" = 2011, "1995 Earthquake" = 1995)))), 

  
  mainPanel(
    plotlyOutput("LinePlot")
  ),

    # Show a plot of the generated distribution
    column(8, mainPanel(width = 12,
       htmlOutput("html", container = div)
      )
    )
  )
)
