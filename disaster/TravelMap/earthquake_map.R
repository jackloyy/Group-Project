# Displays a map of Japanese major earthquakes
earthquake.map <- function() {
  earthquake.data <- read.csv("Data/earthquake_data.csv", stringsAsFactors=FALSE)
  
  g <- list(
    scope = 'asia',
    showframe = F,
    showland = T,
    landcolor = toRGB("grey90")
  )
  
  earthquake.map <- plot_geo(earthquake.data, locationmode = 'country names', sizes = c(100, 384)) %>%
    add_markers(
      x = ~lng, y = ~lat, size = ~magnitude, color = ~deaths, hoverinfo = "text",
      text = ~paste("<br />", "Date: ", earthquake.data$date, "<br />", "Magnitude: ", earthquake.data$magnitude, "<br />", "Deaths: ", earthquake.data$deaths)
    ) %>%
    layout(title = '1995 and 2011 Major Japanese Earthquakes Data', geo = g)
}

