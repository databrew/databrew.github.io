census <- databrew::census
# SECTION 3
# how many rows there are in the database
nrow (census)
# how many columns there are in the database
ncol(census)
# columns name
colnames(census)
sex_table <- table (census$sex)
# how many males, there are 4498 males
sex_table
# % female, there is a proportion of 0.50
prop.table(sex_table)
# max age, 88.81
max(census$age)
# min age, 18.00225
min (census$age)
# age histogram
hist(census$age, main='Population Age Distribution', 
ylab = 'Population' , xlab = 'Age', col = 'blue', border = 'grey')
# SECTION 4
# floor table
floor_table <- table (census$floor_material)
# cement floor, 7588
floor_table
# bike table
bike_table <- table(census$bike)
# barplot
barplot(bike_table, main = 'Bike Use', ylab = 'Population', xlab = 'Bike',
col= 'yellow', border = 'blue')
# variable tv_and_car
census$tv_and_car <- ifelse (census$tv == 'yes' & census$car == 'yes', 
'Has TV and car', 'Does not have TV and car')
# how many people have or don't have 
table(census$tv_and_car)
# proportion
tv_and_car_table <- (census$tv_and_car)
prop.table (tv_and_car_table)
# tv and car and celular table
table(census$celular)
table(census$tv_and_car, census$celular)
# There are 16 people that have TV and car but don't have celular
# SECTION 5
library(cism)
library(sp)
plot(moz0)
# Mozambique orange map
plot(moz0, col='orange')
# Manhiça district level map
plot(man2)
# Manhiça district level map with Title and in green
plot(man2, main= 'Manhiça Map', col='green')
# Manhiça sub-district level
plot(man3)
# scatterplot
plot(census$longitude, census$latitude)
# Manhiça district level map
plot(man2)
points(census$longitude, census$latitude)
# CISM colours map
cism_map(lng=census$longitude, lat = census$latitude)
?cism_map
cism_map_interactive(lng=census$longitude, lat = census$latitude)
