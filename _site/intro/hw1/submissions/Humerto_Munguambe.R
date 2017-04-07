
library(devtools)
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
if(!re_install){
  pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]
}

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
library(devtools)
install_github('databrew/databrew', dependencies = TRUE, force = TRUE)

library(databrew)
install_packages()
library(devtools)
installgithub('joebrew/cism', dependencies = TRUE, force = TRUE)
census <- databrew::census
nrow(census)
ncol(census)
colnames(census)
sex_table <- table(census$sex)
sex_table
prop.table(sex_table)
max(census$age)
min(census$age)
hist(census$age,col = 'blue')
barplot(sex_table)
floor_table<-table(census$floor_material)
floor_table
prop.table(floor_table)
bike_table<-table(census$bike)
bike_table
barplot(bike_table)
census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')
table(census$tv_and_car)
census$tv_and_car<-table(census$tv_and_car)
prop.table(census$tv_and_car)
xt<-table(census$tv_and_car,census$celular)
table(xt)
install.packages('cism')
devtools::install_github('joebrew/cism',force= T,dependencies= T)
library(cism)
library(sp)
plot(moz0,col='orange')
plot(man2,col='green',main= 'distrito de manhica')
plot(moz3)
scatterplot(census$longitude)
??scatterplot

plot(formula, data = parent.frame)
plot (census$longitude,census$latitude)
plot(man2,col='green',main= 'distrito de manhica')
points(census$longitude, census$latitude)
cism_map(lng = census$longitude,
         lat = census$latitude)
?cism_map
plot(man3)
plot(census$longitude,census$latitude)
cism_map(lng = census$longitude,
         lat = census$latitude)
?cism_map_interactive

cism_map_interactive(lng = census$longitude,lat = census$latitude, x = NULL, popup = NULL, spdf = NULL,
                     type = NULL, make_simple = TRUE, n_simple = 10, opacity = 0.5,
                     point_size = 1)