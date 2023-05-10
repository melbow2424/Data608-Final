# Data 608 Final
By: Melissa Bowman
Link to project: [OSHA Inspection Rates for Each U.S. State in 2021 on the 1st and 15th of Each Month (shinyapps.io)](https://melissabowman2424.shinyapps.io/Code/)

My final project focused on analyzing OSHA inspection rates across U.S. states in 2021. This data is crucial for understanding the differences in inspection totals among states. To obtain this data, I utilized the Department of Labor's API, which can be found under the Inspection Table section of their website (https://developer.dol.gov/health-and-safety/dol-osha-enforcement/). Due to limitations in the API's capabilities, I chose to retrieve data for the 1st and 15th of each month in 2021.

After collecting the data, I saved it to my GitHub repository as I encountered difficulties with the API call. The call was taking too long to load, making it challenging to run the app. Once the data was in my repository, I converted it into a spatial polygons data frame, which enabled me to utilize the leaflet package in R to create an interactive shiny app. The app presents a map of the United States, and as you hover over each state, it shows the number of inspections that occurred during the specified time frame.

If time had permitted, I would have liked to include the full total inspections for each day of the year 2021, and then calculated the rate of inspection numbers per established business by state. This would have provided a more vivid picture of which state has the highest overall inspection rate per established business. In retrospect, collecting data from the Bureau of Labor Statistics' API, which is also part of the Department of Labor, may have been a better choice. However, I had already committed to learning and using the DOL's API calls for this project.

This project is particularly helpful for those who want to work with the Department of Labor's API. Additionally, it provides guidance for converting a CSV data frame with location names into a spatial polygons data frame.

## References: 
https://www.bls.gov/charts/injuries-and-illnesses/rate-of-total-recordable-cases-by-state.htm

https://rstudio.github.io/leaflet/choropleths.html

https://faculty.washington.edu/jonno/SISMIDmaterial/SpatialEpiVignette.pdf

https://developer.dol.gov/health-and-safety/dol-osha-enforcement/

## Future References: 

https://www.bls.gov/charts/county-employment-and-wages/percent-change-est-by-state.htm
