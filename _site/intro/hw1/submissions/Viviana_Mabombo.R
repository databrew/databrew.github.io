# This is a comment

# Load the databrew package
# the word "library" means "I am going to use this package"
library(databrew)

install.packages('devtools')
library(devtools)
install_github('databrew/databrew', dependencies = TRUE, force = TRUE)

census <- read.csv('C:/Users/vmabombo/Documents/Docs_R/HW 1/census.csv')
#How many rows are in the data? (hint: use nrow)
nrow(census)

#How many columns are in the data? (hint: use ncol)
ncol(census)

#What are the names of the columns? (hint: use colnames)
colnames(census)

#Create an object called sex_table like this:
sex_table <- table(census$sex)
sex_table

#How many males are in our data?
sex_table

#What percentage of our observations are female? You can do this by running prop.table(sex_table) or by running  sex_table / nrow(census)
prop.table(sex_table)

#What is the maximum age in our data?
max(census$age)

#What is the minimum age in our data?
min(census$age)

#Create a histogram of the ages of the people in our data. Make it pretty (ie, title, axis labels, etc.).
hist(census$age)
hist(census$age, xlab = "Idade", border="blue",
     col="gray", ylab = "Frequencia")

#Create a barplot of the sex_table object you created earlier. Make it pretty.
plot(sex_table )
barplot(sex_table,main = "Total de homens e mulheres", border = "red", col = "pink", ylab = "Total")

#Use the table function to create an object called floor_table which tabulates the floor material of all the houses in our data.
floor_table<- table(census$floor_material)

#How many of our houses have cement floors?
floor_table

#What percentage of our houses have cement floors?
prop.table(floor_table)

#Create another table called bike_table with information about whether people have bikes or not.
bike_table<- table(census$bike)
bike_table

#Create a barplot of bike_table. Make it pretty.
barplot(bike_table, main = "Numero de proprietarios de bikes", border = "black", col = "blue", ylab = "Numero")

#Create a new variable called "tv_and_car" like this:
census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')
#Use table to see how many people have both a TV and a car?
tv_and_car_table<- table(census$tv_and_car)
tv_and_car_table

#Use prop.table to see what percentage of people have both a TV and a car.
prop.table(tv_and_car_table)

#Create a two variable table (a "cross-table") called xt using the tv_and_car variable and the celular variable (hint, use the table function, but just put a comma between the variables)
xt_table <- table(census$tv_and_car, census$celular)
xt_table

#Are there any people that have a TV and a car, but don't have a cell phone?
xt_table

#We're going to make a map of Mozambique. This map is easily available in the cism package. It's called moz0.
library(cism)
library(sp)
plot(moz0)
install.packages('cism')
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
install_github('joebrew/cism', dependencies = TRUE, force = TRUE)
library(cism)
library(sp)
plot(moz0)

#Now, make the above map "orange" by adding a col argument to plot.
plot(moz0,col = "orange")

#Now, make a map of Manhi�a by running plot(man2)
plot(man2)

#Make the same map, but make it green and add a title.
plot(man2, col = "green", main = "Mapa de Manhica")

#Make a map of Manhi�a at the sub-district level.
plot(man3)

#Create a simple scatterplot of the geographic coordinates in our census data (hint: longitude should be on the x-axis).
plot(census$longitude, census$latitude)

#Make a map of Manhi�a at the district level. Then, on the next line, run points(census$longitude, census$latitude) to add the points to our map. It should look like this:
plot(man3)
points(census$longitude, census$latitude)

#Make a map with CISM colors by running the following:
cism_map(lng = census$longitude,
         lat = census$latitude)

#See the documentation on cism_map and how to use it (hint, use a "?")
table(census$longitude, census$latitude)


#Make an interactive map using the cism_map_interactive function. If you do this right, it should look like this.

cism_map_interactive(census$longitude, census$latitude, x = NULL, popup = NULL, spdf = NULL, type = NULL)
