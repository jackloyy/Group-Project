# Displays a chart of monthly US visits to Japan given a dataset of monthly data
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