
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Natural Disaster related"),
  

  column(4, wellPanel(selectInput("select", label = h2("Select Natural disaster"), 
              choices = list("2011 Earthquake" = 2011, "1995 Earthquake" = 1995)))), 

              # selected = 1),
  # checkboxInput("1995","1995"),
  # checkboxInput("2011","2011"),
  # conditionalPanel(
  #    condition = "input.select == 2011",
  #   fluidRow(
  #     column(8,
  #           includeMarkdown("2011.html")
  #     )
  #   )
  # ),
  # 
  # conditionalPanel(
  # 
  #   condition = "input.select == 1995",
  #   fluidRow(
  #     column(8,
  #            includeMarkdown("1995.html")
  #     )
  #   )
  # ),
    
    # Show a plot of the generated distribution
    column(8, mainPanel(width = 12,
       htmlOutput("html", container = div)
      )
    )
  )
)
