library(shiny)
library(dplyr)
library(leaflet)
library(maps)
library(httr)
library(jsonlite)
library(ggplot2)
library(sp)
library(maptools)

# R needs to be loaded first
source("R/data.R")
source("R/ui.R")
source("R/server.R")

# Run the application
shinyApp(ui = ui, server = server)
