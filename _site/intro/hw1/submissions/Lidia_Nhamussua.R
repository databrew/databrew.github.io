library(devtools)
library(databrew)
library(cism)
census <- read.csv ('C:/Users/lnhamussua/Desktop/Rclasses/census.csv')
# 1. How many rows are in the data
nrow(census)
# Answer: 9000
# 2. How many columns are in the data?
ncol(census)
# A: 15
# 3. What are the names of the columns?
colnames(census)
# A: latitute, longitude, floor_material, bike, car, pigs, celular, moto, telephone, tv, wash_after_poop, water_source, sex, age and tv_and_car.
sex_table <- table(census$sex) 
# 5. How many males are in our data?
sex_table
# A: 4498
# 6. What percentage of our observations are female?
prop.table(sex_table)
# A: 0.5% 
# 7. What is the maximum age in our data?
max(census$age)
# A: 88
# 8. What is the minimum age in our data?
min(census$age)
# A: 18
# 9. Create a histogram of the ages of the people in our data
hist(census$age, col= 'grey', ylab = "Numero de individuos", xlab = "Idade em anos", main = "Distribuicao das idades")
barplot(sex_table, col = "blue", ylab = "Numero de individuos", xlab = "genero", main = "Distribuicao de sexos")
#Section 4
#1. create an object
floor_table <- table(census$floor_material)
#2. How many houses have cement floors?
table(census$floor_material)
# A: 7588
#3. What percentage of our houses have cement floors?
prop.table(table(census$floor_material))*100
# A: 84.3%
#4.Create another table called bike_table with information about whether people have bikes or not.
bike_table <- table(census$bike)
#5. Create a barplot of bike_table.
barplot(bike_table, col = "red", main = "How many people have bikes", ylab = "Number of People")
#6. Create a new variable called "tv_and_car" 
census$tv_and_car <- ifelse(census$tv == 'yes' & census$car == 'yes', 'Has TV and car','Does not have TV and car')
#7.  how many people have both a TV and a car?
table(census$tv_and_car)
#A: 509
#8. what percentage of people have both a TV and a car.
prop.table(table(census$tv_and_car))*100
#A: 5.65%
#9. Create a two variable table (a "cross-table") called xt using the tv_and_car variable and the celular variable (hint, use the table function, but just put a comma between the variables)
xt <- table(census$tv_and_car, census$celular)
#10. Are there any people that have a TV and a car, but don't have a cell phone
xt <- ifelse(census$tv_and_car == "yes" & census$celular == "no", "Has TV and car", "Does not have celular")
table(xt)
# A: NO
dplyr::first

# Section 5
library(cism)
library(sp)
plot(moz0, col = "orange")
plot(man2, col = "green", main = "Manhica district")
plot(man3)
plot(census$longitude, census$latitude, col = "pink")
plot(man2)
points(census$longitude, census$latitude, col = "purple")
cism_map(lng = census$longitude,
         lat = census$latitude)
? cism_map
cism_map(lng = census$longitude, lat = census$latitude, x= census$sex, n_simple = 10, opacity = 0.3, point_size = 1.5)
? cism_map_interactive
cism_map_interactive(lng = census$longitude, lat = census$latitude, x= census$sex, popup = NULL, spdf = NULL,
  type = NULL, make_simple = TRUE, n_simple = 10, opacity = 0.5,
  point_size = 1)
