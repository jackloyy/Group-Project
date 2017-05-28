library(shiny)
library(dplyr)
library(plotly)

tourism.data <- read.csv('Data/JTM_inbound20170421eng.csv', stringsAsFactors=FALSE)

# Select date(X) and country columns(X.11)
usa.data <- tourism.data %>% select(X, X.11)

# Creates dataset of monthly visits
usa.monthly <- usa.data %>% filter(row_number() >= 5, row_number() <= 256) %>% mutate(Years = as.integer(1996 + ((row_number() - 1) / 12)))
colnames(usa.monthly) <- c("Months", "Total", "Years")
# Removes years from Months column
i <- 1
while(i < nrow(usa.monthly)) {
  usa.monthly$Months[i] = "Jan．"
  i = i + 12;
}
# Change value to match up with the rest from the same column
usa.monthly$Months[46] = "Oct．"

# Displays a chart given a dataset of monthly data
cum.month.chart <- function(data.month) {
  cum.month.data <- data.month %>% group_by(Months) %>% summarise(avg_visit = mean(as.numeric(gsub(",", "", trimws(Total)))))
  # Sort the data frame in chronological order based on the Months column
  cum.month.data <- cum.month.data[order(factor(cum.month.data$Months, levels = c("Jan．", "Feb．", "Mar．", "Apr．", "May．", "Jun．", "Jul．", "Aug．", "Sep．", "Oct．", "Nov．", "Dec．"))),]
  avg.visit <- cum.month.data$avg_visit
  # Stores and arranges the months in chronological order
  months <- factor(cum.month.data$Months, levels = c("Jan．", "Feb．", "Mar．", "Apr．", "May．", "Jun．", "Jul．", "Aug．", "Sep．", "Oct．", "Nov．", "Dec．"))
  # Display chart based on average visits per month for all years
  cum.monthly.chart <- plot_ly(cum.month.data, x = ~months, y = ~avg.visit, type = 'scatter', mode = 'lines') %>% layout(title = "Avg Monthly Visits from US (1996-2016)")
  return (cum.monthly.chart)
}


shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    cum.month.chart(usa.monthly)
  })
  
})
