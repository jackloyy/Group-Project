
library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Japan Travel data by year"),
  

  sidebarLayout(
    sidebarPanel(
       sliderInput("year",
                   "select year",
                   min = 1990,
                   max = 2016,
                   value = 1999)
    ),
    
    # Show a plot 
    mainPanel(
       plotOutput("linePlot")
    )
  )
))
