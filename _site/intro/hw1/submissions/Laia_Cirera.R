
# R Homework. Class 1. Laia Cirera. 27th March 2017.

#Getting the data 

census <- databrew::census

#SECTION 3. Exploration

##3.1 How many rows are in the data? 

nrow(census)

##9,000

##3.2 How many columns are in the data?

ncol(census)

## 14

##3.3 What are the names of the columns? 

colnames(census)

#[1] "latitude"        "longitude"       "floor_material"  "bike"            "car"             "pigs"           
#[7] "celular"         "moto"            "telephone"       "tv"              "wash_after_poop" "water_source"   
#[13] "sex"             "age"


## 3.4 Create an object called sex_table like this:

sex_table <- table(census$sex)

## 3.5 How many males are in our data?

table(census$sex)

## 4498 

## 3.6 What percentage of our observations are female? You can do this by running prop.table(sex_table) or by running  sex_table / nrow(census)

prop.table(sex_table)

## 50%

## 3.7 What is the maximum age in our data?

max(census$age)

##88.81

## 3.8 What is the minimum age in our data?

min(census$age)

## 18

## 3.9 Create a histogram of the ages of the people in our data. Make it pretty (ie, title, axis labels, etc.).

hist(census$age, main="Age distribution in Manhiça, 2017", xlab='Age', ylab='Frequency', col='purple', lty=15, lwd=2 )

## 3.10 Create a barplot of the sex_table object you created earlier. Make it pretty.

barplot(sex_table, main="Sex distribution in Manhiça, 2017", xlab='Sex', ylab='Frequency', lwd=2, col=c("darkblue","red"))

# SECTION 4. More exploration 

## 4.1 Use the table function to create an object called floor_table which tabulates the floor material of all the houses in our data.

floor_table <- table(census$floor_material)

## 4.2 How many of our houses have cement floors?

table(census$floor_material)

## 7,588

## 4.3 What percentage of our houses have cement floors?

prop.table(floor_table)

## 84,31%

## 4.4 Create another table called bike_table with information about whether people have bikes or not.

bike_table <- table(census$bike)

## 4.5 Create a barplot of bike_table. Make it pretty.

barplot(bike_table)

barplot(bike_table, main="Ownership of a bicycle in Manhiça District", xlab="answer", ylab='Frequency', lwd=2, col=c("pink","yellow"))


## 4.6 Create a new variable called "tv_and_car" like this:
  
census$tv_and_car <- ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')

## 4.7 Use table to see how many people have both a TV and a car?

table(census$tv_and_car)

tv_and_car_table<-table(census$tv_and_car)

## 509

## 4.8 Use prop.table to see what percentage of people have both a TV and a car.
prop.table(tv_and_car_table)

## 5,65%

## 4.9 Create a two variable table (a "cross-table") called xt using the tv_and_car variable and the celular variable (hint, use the table function, but just put a comma between the variables)

xt_table<-table(census$tv_and_car, census$celular)


## 4.10 Are there any people that have a TV and a car, but don't have a cell phone?

table(census$tv_and_car, census$celular)

## yes, 16

# SECTION 5. Mapping

## 5.1 We're going to make a map of Mozambique. This map is easily available in the cism package. It's called moz0.

library(cism)
library(sp)
plot(moz0)

moz1## 5.2 Now, make the above map "orange" by adding a col argument to plot.

plot(moz0, col='orange')


## 5.3 Now, make a map of Manhiça by running plot(man2).

plot(man2)

## 5.4 Make the same map, but make it green and add a title.

plot(man2, main='Manhiça', col='green')


## 5.5 Make a map of Manhiça at the sub-district level.

plot(man3, main='Manhiça', col='green')

## 5.6 Create a simple scatterplot of the geographic coordinates in our census data (hint: longitude should be on the x-axis).

plot(x=census$longitude, y=census$latitude)


## 5.7 Make a map of Manhiça at the district level. Then, on the next line, run points(census$longitude, census$latitude) to add the points to our map. It should look like this:
plot(man3, main='Manhiça', col='green')
points(census$longitude, census$latitude)
  
## 5.8 Make a map with CISM colors by running the following:

cism_map(lng = census$longitude,
         lat = census$latitude)

## 5.9 See the documentation on cism_map and how to use it (hint, use a "?").

?cism_map

cism_map(lng=census$longitude, lat=census$latitude, n_simple = 10, opacity = 0.5, point_size = 1)

## 5.10 Make an interactive map using the cism_map_interactive function. If you do this right, it should look like this:
?cism_map_interactive

cism_map_interactive(lng=census$longitude, lat=census$latitude, x = NULL, popup = NULL, spdf = NULL, type = NULL, make_simple = TRUE, n_simple = 10, opacity = 0.5,point_size = 1)
