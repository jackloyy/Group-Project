earthquake.data <- read.csv("../Data/earthquake_data.csv", stringsAsFactors=FALSE)

g <- list(
  scope = 'japan',
  showframe = F,
  showland = T,
  landcolor = toRGB("grey90")
)

# g <- list(
#   scope = 'japan',
#   projection = list(type = 'albers japan'),
#   showland = TRUE,
#   landcolor = toRGB("gray85"),
#   subunitwidth = 1,
#   countrywidth = 1,
#   subunitcolor = toRGB("black"),
#   countrycolor = toRGB("black")
# )

earthquake.map <- plot_geo(earthquake.data, locationmode = 'country names', sizes = c(1, 384)) %>%
  add_markers(
    x = ~lng, y = ~lat, locations = ~country, size = ~injuries, color = ~deaths, hoverinfo = "text",
    text = ~paste(" ", earthquake.data$region, "<br />", "Date: ", earthquake.data$date, "<br />", "Injuries: ", earthquake.data$injuries, "<br />", "Deaths: ", earthquake.data$deaths)
  ) %>%
  layout(title = '1995 and 2011 Major Japanese Earthquakes Data', geo = g)

earthquake.map
