# Displays a multiple axes chart given the type of financial information, typeFinance
financial.annual.chart <- function(typeFinance) {
  tourism.data <- read.csv('Data/JTM_inbound20170421eng.csv', stringsAsFactors=FALSE)
  # Select date(X) and country columns(X.11)
  usa.data <- tourism.data %>% select(X, X.11)
  # Creates dataset of annual visits (1996 - 2016)
  data.annual <- usa.data %>% filter(row_number() >= 266, row_number() <= 292)
  colnames(data.annual) <- c("Years", "Total")
  # Reads in the financial datasets
  currency <- read.csv('Data/currency_rates.csv', stringsAsFactors=FALSE) %>% filter(Years != "2016")
  income <- read.csv('Data/income.csv', stringsAsFactors=FALSE)
  # Filters our the year 2016 to match the financial datasets
  data.annual <- data.annual %>% filter(Years != "2016")
  
  # Stores and chops off the commas in the numbers
  usa.total <- as.numeric(gsub(",", "", data.annual$Total))
  currency.total <- as.numeric(gsub(",", "", currency$Total))
  income.total <- as.numeric(gsub(",", "", income$Total))
  
  financial.total <- ""
  financial.type <- ""
  # Initializes the type of financial information specified
  if(typeFinance == "currency") {
    financial.total <- currency.total
    financial.type <- "Currency"
  } else if(typeFinance == "income") {
    financial.total <- income.total
    financial.type <- "Income"
  }
  
  ay <- list(
    tickfont = list(color = "red"),
    overlaying = "y",
    side = "right",
    title = financial.type
  )
  
  p <- plot_ly() %>%
    add_lines(x = ~data.annual$Years, y = ~usa.total, name = "Visits v.s Year") %>%
    add_lines(x = ~data.annual$Years, y = ~financial.total, name = paste(financial.type, "v.s Year"), yaxis = "y2") %>%
    layout(
      title = "Financial Impact on U.S Visits to Japan", yaxis2 = ay,
      xaxis = list(title="Years"),
      yaxis = list(title="Total Visitors (In Million)")
    )
  
  return (p)
}