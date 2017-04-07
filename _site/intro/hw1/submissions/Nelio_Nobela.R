version
version minor
install.packages('devtools')
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
pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]
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
library(databrew)
library(databrew)
install_github('databrew/databrew', dependencies = TRUE, force = TRUE)
library(databrew)
install_packages()
library(devtools)
install_github('joebrew/cism', dependencies = TRUE, force = TRUE)
census <- databrew::census
nrow
nrow
censusrow
census (row)
table(census)
census <- databrew::census
row(census, as.factor = FALSE)
row(census)
col(census)
sex_table <- table(census$sex)
table(census$sex)
nrow(census)
ncol(census)
colnames(census)
prop.table(sex_table)
sex_table / nrow(census)
max(census$age)
min(census$age)
hist(census$age)
hist(x=main="AGE FREQUENCY")
hist(census$age, main = 'AGE FREQUENCY')
hist(census$age, main = 'AGE FREQUENCY', col = 'blue')
hist(census$age, main = 'AGE FREQUENCY', col = 'blue', x='years')
barplot(sex_table)
barplot(sex_table, main ='sex', col ='blue')
table(floor_table)
floor_table<-(census$floor_material)
table(census$floor_material)
unique(census$floor_material)
floor_table / nrow(census)
prop.table(floor_table)
table(floor_table/floor(census))
hist(census$floor_material)
floor_table/floor
table()
floor_table
cement_floor<-7588
cement_floor / nrow(census)
prop.table(cement_floor)
bike_table <- table(census$bike)
barplot(bike_table)
barplot(bike_table, main = 'BIKE FREQUENCY', col = 'blue')
barplot(bike_table, main = 'BIKE FREQUENCY', col = 'blue', x='number people')
census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')
table(census$tv_and_car)
prop.table(tv_and_car)
tvandcar<-509
tv_and_car / nrow(census)
table(census$car)
table(census$tv_and_car,census$celular)
table
table(census$celular,tv_and_car)
census$tv_and_car,celular
library(cism)
library(sp)
plot(moz0)
plot(moz0, col='Orange')
plot(man2)
plot(man2, col='green', main='MANHICA MAP')
plot(man3)
scatterplot(census)
scatter.smooth(census)
plot(x=census$longitude, y=census$latitude)
plot(man2)
points(census$longitude, census$latitude)
cism_map(lng = census$longitude,
         lat = census$latitude)
?cism_map
?cism_map_interactive
cism_map_interactive(longitude, lat, x = NULL, popup = NULL, spdf = NULL,
                     type = NULL, make_simple = TRUE, n_simple = 10, opacity = 0.5,
                     point_size = 1)
cism_map_interactive(lng = census$longitude,
                     lat = census$latitude)
