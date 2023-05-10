# Define the server
server <- function(input, output) {
  
  bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
  pal <- colorBin("YlOrRd", domain = state_polygons$Count, bins = bins)
  
  labels <- sprintf(
    "<strong>%s</strong><br/>%g inspections",
    state_polygons$State, state_polygons$Count
  ) %>% lapply(htmltools::HTML)
  
  # Create the leaflet map
  output$map <- renderLeaflet({
    leaflet(state_polygons) %>%
      addTiles() %>%
      addPolygons(
        fillColor = ~pal(Count),
        weight = 2,
        opacity = 1,
        color = "white",
        dashArray = "3",
        fillOpacity = 0.7,
        highlight = highlightOptions(
          weight = 5,
          color = "#666",
          dashArray = "",
          fillOpacity = 0.7,
          bringToFront = TRUE
        ),
        label = labels,
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto")
      ) %>%
      addLegend(
        pal = pal,
        values = ~Count,
        opacity = 0.7,
        title = NULL,
        position = "bottomright"
      )
  })
}