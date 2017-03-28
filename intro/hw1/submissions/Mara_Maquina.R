install.packages('dev
                 tools')
library(devtools)
install_github('databrew/databrew', dependencies = TRUE, force = TRUE)
pkgs <- c('data.table',
          'devtools',
          'extrafont',
          'ggmap',
          'ggthemes',
          'gsheet',
          'knitr',
          'leaflet',
          'maptools',
          'raster',
          'RColorBrewer',
          'rgdal',
          'rgeos',
          'rmarkdown',
          'sp',
          'stringdist',
          'tidyr',
          'tidyverse',
          'tufte')
if(!re_install){
  pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]
}

pkgs <- sort(pkgs)

if(length(pkgs) == 0){
  message('All packages already installed. No action being taken.')
} else {
  the_message <-
    paste0('Installing the following packages:\n',
           paste0('--- ', pkgs, collapse = '\n'))
  message(the_message)
  for (i in 1:length(pkgs)){
    message('Installing ', pkgs[i])
    install.packages(pkgs[i])
  }
}
library(devtools)
install_github('databrew/databrew')

# Census<- read.csv('C:/Users/mmaquina/Desktop/R/Census.csv')
#this file is diferent, there is no sex variable here so i get the second option below

census <- databrew::census

####################################Section 3: Exploration#######################

#1. How many rows are in the data?
nrow(census)

#2. How many columns are in the data
ncol(census)

#3. What are the names of the columns
colnames(census)

#4.Create an object called sex_table

sex_table <- table(census$sex)

#5. How many males are in our data?_
sex_table
?which()

#6. What percentage of our observations are female?
prop.table(sex_table)

#7.What is the maximum age in our data
max(census$age)

#8.What is the minimum age in our data
min(census$age)

#9.Create a histogram of the ages of the people in our data. 
#Make it pretty (ie, title, axis labels, etc.)
hist(census$age, xlab = 'Age', 
                 ylab = 'Number of people',
                 main = "Census age data", 
                 col = ' pink')

#Create a barplot of the sex_table object you created earlier. Make it pretty

barplot(sex_table, col = c("mistyrose", "cornsilk"), 
                    main = 'Total number of males and females',
                    lwd = 2, space= 0.5)

################################Section 4: More exploration#######################

#1.Use the table function to create an object called floor_table which tabulates the floor material of all the houses in our data.
floor_table<-table(census$floor_material)

#2. How many of our houses have cement floors?
floor_table

#3. What percentage of our houses have cement floors?
prop.table(floor_table)

#4.Create another table called bike_table with information about whether people have bikes or not.
bike_table<-table(census$bike)
bike_table

#5. Create a barplot of bike_table. Make it pretty.
barplot(bike_table, col='orange', 
                    ylab = 'Number of people', 
                    main = 'Really, many people dont have bike')

#6. Create a new variable called "tv_and_car" like this:
census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')

#7.Use table to see how many people have both a TV and a car?
table(census$tv_and_car)

#8. Use prop.table to see what percentage of people have both a TV and a car
census$tv_and_car<-table(census$tv_and_car)
prop.table(census$tv_and_car)

#9. Create a two variable table (a "cross-table") called xt using the tv_and_car variable and 
#the celular variable (hint, use the table function, but just put a comma between the variables)

xt <- table(census$tv_and_car,census$celular)

#Are there any people that have a TV and a car, but don't have a cell phone?
table(xt)

##############################5: Mapping###########################

#1. We're going to make a map of Mozambique. This map is easily available in the cism package. It's called moz0.

pkgs <- c('data.table',
          'devtools',
          'extrafont',
          'ggmap',
          'ggthemes',
          'gsheet',
          'knitr',
          'leaflet',
          'maptools',
          'raster',
          'RColorBrewer',
          'rgdal',
          'rgeos',
          'rmarkdown',
          'sp',
          'stringdist',
          'tidyr',
          'tidyverse',
          'tufte')

# Only install those which don't already have
pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]

# Alphabetize
pkgs <- sort(pkgs)

if(length(pkgs) == 0){
  message('All packages already installed. No action being taken.')
} else {
  the_message <-
    paste0('Installing the following packages:\n',
           paste0('--- ', pkgs, collapse = '\n'))
  message(the_message)
  for (i in 1:length(pkgs)){
    message('Installing ', pkgs[i])
    install.packages(pkgs[i])
  }
}

devtools::install_github('joebrew/cism', force = T, dependencies = T)



#1. We're going to make a map of Mozambique. This map is easily available in the cism package. It's called moz0.
library(cism)
library(sp)
plot(moz0)

#2. Now, make the above map "orange" by adding a col argument to plot.
plot(moz0, col='orange')

#3.Now, make a map of Manhiça by running plot(man2)
plot(man2)

#4.Make the same map, but make it green and add a title
plot(man2, col='green', main='Manhica district')

#5. Make a map of Manhiça at the sub-district level.
plot(man3)

#6. Create a simple scatterplot of the geographic coordinates in 
#our census data (hint: longitude should be on the x-axis)
plot(census$longitude, census$latitude)

#7.Make a map of Manhiça at the district level. Then, on the next line, 
#run points(census$longitude, census$latitude) to add the points to our map. It should look like this
plot(man3)
points(census$longitude, census$latitude)

#8.Make a map with CISM colors by running the following:
cism_map(lng = census$longitude,
         lat = census$latitude)

#9. See the documentation on cism_map and how to use it (hint, use a "?")
?cism_map_interactive

#10. Make an interactive map using the cism_map_interactive function. 
#If you do this right, it should look like this
cism_map_interactive(lng = census$longitude, lat = census$latitude, x = NULL, popup = NULL, spdf = NULL,
                     type = NULL, make_simple = TRUE, n_simple = 10, opacity = 0.5,
                     point_size = 1)

