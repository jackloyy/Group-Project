library(plotly)
library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Finance factor related"),
  
  column(4, wellPanel(selectInput("select", label = h2("Select Finance type"), 
              choices = list("currency" = 1, "income" = 2)))), 
  
  # Show a plot of the generated distribution
  column(8, mainPanel(width = 12, 
    plotlyOutput("LinePlot"), 
    htmlOutput("html", container = div)
      )
    )
  )
)