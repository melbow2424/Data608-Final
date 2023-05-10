# Read in the data file
# read the CSV file using read.csv()
data = read.csv('https://raw.githubusercontent.com/melbow2424/Data608-Final/main/data_01_15.csv')

# Count the occurrences of each state abbreviation
state_counts <- table(data$SITE_STATE)

# Convert the state counts to a data frame
state_counts_df <- data.frame(State = names(state_counts), Count = as.numeric(state_counts))


# Define a named vector that maps abbreviations to lowercase state names
abbrev_to_name <- setNames(tolower(state.name), state.abb)

# Use the mutate() function to create a new columns and omit na values
df <- state_counts_df %>% 
  mutate(state_name = abbrev_to_name[State])%>%
  mutate(state_name = ifelse(state_name == "new york", "new york:main", state_name))%>%
  mutate(state_name = ifelse(state_name == "massachusetts", "massachusetts:main", state_name))%>%
  mutate(state_name = ifelse(state_name == "north carolina", "north carolina:main", state_name))%>%
  mutate(state_name = ifelse(state_name == "virginia", "virginia:main", state_name))%>%
  mutate(state_name = ifelse(state_name == "washington", "washington:main", state_name))%>%
  mutate(state_name = ifelse(state_name == "michigan", "michigan:south", state_name))%>%
  na.omit()

#(df$state_name)
#Creating a SpatialPolygons from USA map to use in Leaflet
state_map <- map("state", c(), fill = TRUE, plot = FALSE)
#(state_map$names)
state_names <- as.character(state_map$names)
state <- map2SpatialPolygons(state_map, IDs = state_names, proj4string = CRS("+proj=longlat"))

# First, convert df into a data frame with the same order of state_names as the sp object
df <- df[match(state_names, df$state_name), ]

# Next, create a new data frame with the state polygons and the data from df
state_df <- data.frame(State = df$State, Count = df$Count, row.names = state_names)
state_polygons <- SpatialPolygonsDataFrame(state, state_df)

#check with a plot
#plot(state_polygons)


