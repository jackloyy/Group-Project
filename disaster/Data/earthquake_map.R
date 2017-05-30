earthquake.map <- function() {
  earthquake.data <- read.csv("../Data/earthquake_data.csv", stringsAsFactors=FALSE)
  
  g <- list(
    scope = 'japan',
    showframe = F,
    showland = T,
    landcolor = toRGB("grey90")
  )
  
  earthquake.map <- plot_geo(earthquake.data, locationmode = 'country names', sizes = c(1, 384)) %>%
    add_markers(
      x = ~lng, y = ~lat, size = ~magnitude, color = ~deaths, hoverinfo = "text",
      text = ~paste(" ", earthquake.data$magnitude, "<br />", "Date: ", earthquake.data$date, "<br />", "Injuries: ", earthquake.data$injuries, "<br />", "Deaths: ", earthquake.data$deaths)
    ) %>%
    layout(title = '1995 and 2011 Major Japanese Earthquakes Data', geo = g)
}