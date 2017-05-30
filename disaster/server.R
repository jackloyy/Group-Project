library(dplyr)
library(shiny)
library(plotly)
# library(shinydashboard)

tourism.data <- read.csv('Data/JTM_inbound20170421eng.csv', stringsAsFactors=FALSE)

# Select date(X) and country columns(X.11)
usa.data <- tourism.data %>% select(X, X.11)


# Creates dataset of annual visits (1996 - 2016)
usa.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)
colnames(usa.annual) <- c("Years", "Total")




usa.annual.graph <- function(data.annual, year) {
  
  graph.data <- data.annual %>% filter(Years == year - 1 | Years == year - 2 | Years == year + 1 | Years == year + 2 | Years == year) 
  # Stores and chops off the commas in the numbers
  total <- as.numeric(gsub(",", "", graph.data$Total));

  Yearly.chart <- plot_ly(graph.data, x = ~Years, y = ~total, type = 'scatter', mode = 'lines', color = 'red') %>% 
    layout(title = paste("Yearly Visits from US in", year))
  
  Yearly.chart
  
}


shinyServer(function(input, output) {


  # observeEvent(
  #   input$select,
  #   insertUI("#html", "afterBegin", tabPanel("Markdown", fluidRow(
  #     column(8, align = "center",
  #            includeHTML(paste0(input$select, ".html"))
  #     )
  #   )))
  # )
  
  output$html <- renderUI( {
    if(input$select == 2011) {
      includeHTML("2011.html")
    } else if(input$select == 1995) {
      includeHTML("1995.html")
    }
  })

   # observeEvent(
   #  input$select,
   #   insertUI("#LinePlot", "afterBegin", tabPanel("HTML", fluidRow(
   #     column(10, align = "center",
   #           htmlOutput(paste0(input$select, ".html"))
   #     )
   #   )))
   # )
   # 


  
})
