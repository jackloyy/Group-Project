library(dplyr)

tourism.data <- read.csv('../Data/JTM_inbound20170421eng.csv', stringsAsFactors=FALSE)

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
# Creates dataset of annual visits (1996 - 2016)
usa.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)
colnames(usa.annual) <- c("Years", "Total")

currency <- read.csv('../Data/currency_rates.csv', stringsAsFactors=FALSE);
income <- read.csv('../Data/income.csv', stringsAsFactors=FALSE);

ay <- list(
  tickfont = list(color = "red"),
  overlaying = "y",
  side = "right",
  title = "Currency" # Finance
)
p <- plot_ly() %>%
  add_lines(x = ~usa.annual$Years, y = ~usa.annual$Total, name = "Visits v.s Year") %>%
  add_lines(x = ~usa.annual$Years, y = ~1:3, name = "Currency v.s Year", yaxis = "y2") %>%
  layout(
    title = "Financial Impact on U.S Visits to Japan", yaxis2 = ay,
    xaxis = list(title="x")
  )