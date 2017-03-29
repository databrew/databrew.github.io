version$minor
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
install_github('databrew/databrew')
install_github('joebrew/cism')

census <- read.csv('C:/Users/cmelembe/Desktop/census.csv')

## How many rows are in the data? (hint: use nrow)
nrow(census)


## How many columns are in the data? (hint: use ncol)
ncol(census)

## What are the names of the columns? (hint: use colnames)
colnames(census)

## Create an object called sex_table like this:
sex_table <- table(census$sex)

## How many males are in our data?
head(sex_table)

## What percentage of our observations are female? You can do this by running prop.table(sex_table) or by running sex_table / nrow(census)
prop.table(sex_table)

## What is the maximum age in our data?
max(census$age)

##What is the minimum age in our data?
min(census$age)

## Create a histogram of the ages of the people in our data. Make it pretty (ie, title, axis labels, etc.).
hist(census$age)
hist(census$age, breaks = 10, main = "histogram of age according sex", col="red", xlab = "people age", ylab = "loubelia age" )

## Use the table function to create an object called floor_table which tabulates the floor material of all the houses in our data.
floor_table <-table(census$floor_material)

## How many of our houses have cement floors?
head(floor_table)

## What percentage of our houses have cement floors?
prop.table(floor_table)

## Create another table called bike_table with information about whether people have bikes or not.
bike.table<-table(census$bike)

##Create a barplot of bike_table. Make it pretty.
barplot(bike.table)
barplot(bike.table, width = 2, space = NULL, main = "people with bike",col = c(7,4))

## Create a new variable called "tv_and_car" like this:
census$tv_and_car<-ifelse(census$tv == 'yes' & census$car == 'yes','has tv and car',
                            'Does not have tv and car')
## Use table to see how many people have both a TV and a car?
head(census)
tv_and_car.table <- table(census$tv_and_car)
tv_and_car.table
head(tv_and_car.table)


## Use prop.table to see what percentage of people have both a TV and a car.
prop.table(tv_and_car.table)


## Create a two variable table (a "cross-table") called xt using the tv_and_car variable and the celular variable (hint, use the table function, but just put a comma between the variables)
xt<-table(census$tv_and_car,census$celular)
xt

 ## section 5
install.packages('cism')
library(cism)
library(sp)
plot(moz0)
