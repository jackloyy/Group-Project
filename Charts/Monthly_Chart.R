# Displays a chart given a dataset of monthly data and a year
usa.month.chart <- function(data.month, year) {
  monthly.data <- data.month %>% filter(Years == year)
  # Stores and chops off the commas in the numbers
  total <- as.numeric(gsub(",", "", monthly.data$Total));
  # Stores and arranges the months in chronological order
  months <- factor(monthly.data$Months, levels = c("Jan．", "Feb．", "Mar．", "Apr．", "May．", "Jun．", "Jul．", "Aug．", "Sep．", "Oct．", "Nov．", "Dec．"))
  # Display chart based on visits per month
  monthly.chart <- plot_ly(monthly.data, x = ~months, y = ~total, type = 'scatter', mode = 'lines') %>% layout(title = paste("Monthly Visits from US in", year))
  return (monthly.chart)
}