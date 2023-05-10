ui <- fluidPage(
  titlePanel("State Counts Map"),
  mainPanel(
    leafletOutput("map")
  )
)