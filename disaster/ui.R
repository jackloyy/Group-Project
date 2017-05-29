
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Natural Disaster related"),
  
  selectInput("select", label = h2("Select Natural disaster"), 
              choices = list("2011 Earthquake" = 1, "1995 Earthquake" = 2), 
              selected = 1),
  checkboxInput("1995","1995"), 
  checkboxInput("2011","2011"),
  conditionalPanel(
    
    condition = "2011 == ture",
    fluidRow(
      column(8,
             includeMarkdown("2011.html")
      )
    )
  ),
  
  conditionalPanel(
    
    condition = "1995 == true",
    fluidRow(
      column(8,
             includeMarkdown("1995.html")
      )
    )
  ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("LinePlot")
    )
  )
)
