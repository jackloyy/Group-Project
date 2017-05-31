library(shiny)
library(plotly)

# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Natural Disaster related"),
  

  column(4, wellPanel(selectInput("select", label = h2("Select Natural disaster"), 
              choices = list("2011 Great East (Tohoku) Earthquake" = 2011, "1995 Hanshin Earthquake" = 1995)))), 

    # Show a plot of the generated distribution
    column(8, mainPanel(width = 12,
       plotlyOutput("LinePlot"), 
       htmlOutput("html", container = div)
      )
    )
  )
)
