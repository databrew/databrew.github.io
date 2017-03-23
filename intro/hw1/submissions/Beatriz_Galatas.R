# Homework 1 
# Due 27th of March 2017
# Beatriz Galatas

#Section 1: Installation

  version$minor
  
  #Devtools
  install.packages("devtools")
  library(devtools)
  
  #databrew
  pkgs <- c("data.table", "devtools", "ggmap", "ggthemes", 
            "gsheet", "knitr", "leaflet", "maptools", "raster", "RColorBrewer", 
            "rgdal", "rgeos", "rmarkdown", "sp", "tidyr", "tidyverse", 
            "tufte")
  pkgs <- pkgs[!(pkgs %in% installed.packages()[, "Package"])]
  pkgs <- sort(pkgs)
  if (length(pkgs) == 0) {
    message("All packages already installed. No action being taken.")
  } else {
    the_message <- paste0("Installing the following packages:\n", 
                          paste0("--- ", pkgs, collapse = "\n"))
    message(the_message)
    for (i in 1:length(pkgs)) {
      message("Installing ", pkgs[i])
      install.packages(pkgs[i])
    }
  }
  library(devtools)
  install_github('databrew/databrew', force = TRUE)
  
  #Other packages 
  library(databrew)
  install_packages()

# Section 2: Getting new data 
census <- databrew::census


#Section 3: Exploration 

  #Questions 
  #1. How many rows are in the data? --> 9000
  nrow(census)
  #2. How many columns are in the data --> 14
  ncol(census)
  #3. What are the names of the columns? --> "latitude" "longitude" "floor_material"  "bike" "car" "pigs" "celular" "moto" "telephone""tv" "wash_after_poop" "water_source" "sex" "age" 
  colnames(census)
  #4. Create an object called sex_table
  sex_table <- table(census$sex)
  #5. How many males are in our data? --> 4502 females / 4498 males
  table(census$sex)
  #6. What percentage of our observations are female? --> 0.5002222 females / 0.4997778 males
  prop.table(sex_table)
  #7. What is the maximum age in our data? --> 88.81537
  max(census$age)
  #8. What is the minimum age in our data? --> 18.00225
  min(census$age)
  #9. Create a histogram of the ages of the people in our data. Make it pretty (ie, title, axis labels, etc.).
  hist(census$age, 
       main="Age Distribution", 
       xlab="Age", 
       ylab="Density",
       col="orange", 
       border="darkgray")
  #10. Create a barplot of the sex_table object you created earlier. Make it pretty.
  barplot(sex_table, 
          main="Gender Distribution",
          xlab="Gender",
          ylab="Number",
          col=c("yellow","green"))
  
#Section 4: More exploration 

  #1. Use the table function to create an object called floor_table which tabulates the floor material of all the houses in our data.
  floor <- table(census$floor_material)
  #2. How many of our houses have cement floors? --> 7588
  floor
  #3. What percentage of our houses have cement floors? --> 0.8431111111   
  prop.table(floor)
  #4. Create another table called bike_table with information about whether people have bikes or not.
  bike_table <- table(census$bike)
  #5. Create a barplot of bike_table. Make it pretty.
  barplot(bike_table, 
          main="Bike Ownership",
          ylab="Number",
          col=c("blue", "red"))
  #6. Create a new variable called “tv_and_car” like this:
  census$tv_and_car <-
    ifelse(census$tv == 'yes' &
             census$car == 'yes',
           'Has TV and car',
           'Does not have TV and car')
  #7. Use table to see how many people have both a TV and a car? --> 509
  table(census$tv_and_car)
  #8. Use prop.table to see what percentage of people have both a TV and a car.-->  0.05655556 
  tv_and_car_num <- table(census$tv_and_car)
  prop.table(tv_and_car_num)
  #9. Create a two variable table (a “cross-table”) called xt using the tv_and_car variable and the celular variable (hint, use the table function, but just put a comma between the variables)
  xt <- table(census$tv_and_car, census$celular)
  #10. Are there any people that have a TV and a car, but don’t have a cell phone? --> yes, 16
  xt  

#Section 5: Mapping 
  install.packages('stringdist')
  install.packages('extrafont')
  library(devtools)
  install_github('joebrew/cism')
  #1. We’re going to make a map of Mozambique. This map is easily available in the cism package. It’s called moz0
  .libPaths("/Users/beatrizgalatas/Documents/R_packages")
  install_github('joebrew/cism',force=TRUE)
  library(cism)
  library(sp)
  plot(moz0)
  #2. Now, make the above map “orange” by adding a col argument to plot.
  plot(moz0, col="orange")
  #3. Now, make a map of Manhiça by running plot(man2).
  plot(man2)
  #4. Make the same map, but make it green and add a title.
  plot(man2, col="green", main="Manhiça District")
  #5. Make a map of Manhiça at the sub-district level.
  plot(man3)
  #6. Create a simple scatterplot of the geographic coordinates in our census data (hint: longitude should be on the x-axis).
  plot(x=census$longitude, 
       y=census$latitude)
  #7. Make a map of Manhiça at the district level. Then, on the next line, run points(census$longitude, census$latitude) to add the points to our map. It should look like this:
  plot(man2)
  points(census$longitude, census$latitude)
  #8. Make a map with CISM colors by running the following:
  cism_map(lng = census$longitude,
           lat = census$latitude)
  #9. See the documentation on cism_map and how to use it (hint, use a “?”).
  ?cism_map
  #10. Make an interactive map using the cism_map_interactive function. If you do this right, it should look like this:
  cism_map_interactive(lng = census$longitude,
                      lat = census$latitude)
  