# HW1_Ana Maria Fonseca

#instalation
version$minor

#devtools
install.packages("devtools")
library(devtools)

#databrew (was not possible to instal all the pkgs)
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

# I was not able to instal this one
install_github('databrew/databrew', force = TRUE)

# and I was also not able to instal the "Other packages" 
library(databrew)
install_packages()

## SECTION 2: Getting new data (bea gave me the DB census)
census <- read.csv ("/Users/anamariafonseca/Desktop/R statistics/census.csv")
nrow(census)

## SECTION 3: Exploration

# How many rows are in the data? (hint: use nrow) = 9000
nrow(census)

#How many columns are in the data? (hint: use ncol) = 15
ncol(census)

#What are the names of the columns? (hint: use colnames)= "X" "latitude" "longitude" "floor_material"  "bike""car""pigs""celular" "moto""telephone" "tv""wash_after_poop""water_source" "sex" "age"   
colnames(census)

#Create an object called sex_table
sex_table <- table(census$sex)

#How many males are in our data?= 4498
table(census$sex)

#What percentage of our observations are female? = 50%
prop.table(sex_table)

#What is the maximum age in our data? = 88.8
max(census$age)

#What is the minimum age in our data? = 18
min(census$age)

#Create a histogram of the ages of the people in our data. Make it pretty (ie, title, axis labels, etc.).
hist(census$age, 
     main="Age of population", 
     xlab="Age", 
     ylab="population",
     col="grey", 
     border="black")

#Create a barplot of the sex_table object you created earlier. Make it pretty.
barplot(sex_table, 
        main="sex of population",
        xlab="sex",
        ylab="Number",
        col="grey")

## SECTION 4

#Use the table function to create an object called floor_table which tabulates the floor material of all the houses in our data.
floor <- table(census$floor_material)

#How many of our houses have cement floors? = 7588
floor
  #or
table(census$floor_material)

#What percentage of our houses have cement floors? = 84%
prop.table(floor)

#Create another table called bike_table with information about whether people have bikes or not.
bike_table <- table(census$bike)

#Create a barplot of bike_table. Make it pretty.
barplot(bike_table, 
        main="Bike",
        ylab="Number",
        col="grey")

#Create a new variable called “tv_and_car” 
census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')

#Use table to see how many people have both a TV and a car? = 509
table(census$tv_and_car)

#Use prop.table to see what percentage of people have both a Tv and car = 5.7%
tvandcar_table <- table(census$tv_and_car)
prop.table(tvandcar_table)

#Create a two variable table (a “cross-table”) called xt using the tv_and_car variable and the celular variable 
xt<- table(census$tv_and_car, census$celular)

#Are there any people that have a TV and a car, but don’t have a cell phone? = 16
xp

## SECTION 5 (not possible to do with my vertion, because I can´t instal all the pakgs, I will do wednesday after our meeting)


