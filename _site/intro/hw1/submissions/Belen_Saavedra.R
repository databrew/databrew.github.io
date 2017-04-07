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
install_github('databrew/databrew')
census <- read.csv('C:/Users/Amone/Desktop/census.csv')
library(databrew)
install_packages()
library(devtools)
install_github('joebrew/cism')
library(databrew)
install_packages()
library(devtools)
install_github('joebrew/cism')
census <- databrew::census
nrow(census)
ncol(census)
colnames(census)
sex_table <- table(census$sex)
sex_table<-table[census$sex=='male']
unique(census$sex)
sex_table / nrow(census)
male<-sex_table[sex_table$chick=='male']
max(sex_table)
max(age)
age<-table(census$age)
max(age)
max(census$age)
min(census$age)
hist(census$age)
hist(xlab='age', ylab='freq')
hist(x='age',y='freq')
age<-table(census$age)

hist(age)
hist(census$age)
hist(census$age, xlab='ages',ylab='freq')
hist(census$age, xlab='ages',ylab='freq', col='green',breaks=20,main='Ages in Swaziland')
sex_table/nrow(census)
table(census$sex)
boxplot(x='ages',y='frequency')
barplot(x='ages',y='freq')
plot(x='ages',y='freq')
plot(sex_table)
sex_table <- table(census$sex)
barplot(sex_table)
barplot(sex_table,col='blue', main='sex distribution',space=NULL,beside = FALSE,density = 4,border = 'green')

floor_table<-table(census$floor_material)
unique(floor_table)
cemento<-floor_table(floor_material=='cement')
sex_table/nrow(census)
table(census$sex)
table(census$floor_material)
floor_table/nrow(census)
bike_table<-(census$bike)
census <- databrew::census
bike_table<-(census$bike)
barplot(bike_table)
hist(census$bike_table)
hist(census$bike)
unique(bike_table)
bike_table/nrow(census)
floor_table/nrow(census)
bike_table<-(census$bike)
unique(bike_table)
bike_table/nrow(census)
census <- databrew::census
nrow(census)
warnings()
sex_table <- table(census$sex)
sex_table / nrow(census)
hist(age)
hist(census$age)
hist(census$age, xlab='ages',ylab='freq')
hist(census$age, xlab='ages',ylab='freq', col='green',breaks=20,main='Ages in Swaziland')
barplot(sex_table)
barplot(sex_table,col='blue', main='sex distribution',space=NULL,beside = FALSE,density = 4,border = 'green')
floor_table<-table(census$floor_material)
floor_table<-table(census$floor_material)
unique(floor_table)
floor_table/nrow(census)
bike_table<-table(census$bike)
unique(bike_table)
barplot(bike_table)
barplot(bike_table,col='pink',main='Bikes$life',space=NULL,density=50)
census$tv_and_car<-ifelse(census$tv=='yes'&census$car=='yes','Has tv and car','Does not have TV and car')
tv_and_car<-table(census$tv)
tv_and_car<-table(census$car)
unique(tv_and_car)
tv_and_car/nrow(census)
table(row.names(tv_and_car))
prop.table(tv_and_car,margin=NULL)
celular<-table(census$celular)
table(x='tv_and_car',y='celular')
xt<-table(census$tv_and_car, census$celular)
unique(xt)
table(row.names(xt))
xt<-table(census$tv_and_car, census$celular)
xt
library(cism)
library(devtools)
install_github('databrew/databrew')
census <- read.csv('C:/Users/Amone/Desktop/census.csv')
library(databrew)
install_packages()
library(devtools)
install_github('joebrew/cism')
library(databrew)
install_packages()
library(devtools)
install_github('joebrew/cism')
library(cism)
library(sp)
plot(moz0)
plot(moz1)
plot(moz2)
plot(moz0,col='orange')
plot(man2)
plot(man2,col='orange',main='Manhica District')
plot(man3)
plot(man3,main='Manhica District')
plot(x=census$latitude,y=census$longitude)
plot(x=census$longitude, y=census$latitude)
plot(man3)
points(census$longitude,census$latitude)
plot(man2)
points(census$longitude,census$latitude)
census <- databrew::census
points(census$longitude,census$latitude)
cism_map(lng = census$longitude,lat = census$latitude)
cism_map(lng = census$longitude,lat = census$latitude)
cism_map_interactive(lng = census$longitude,lat = census$latitude)
?cism_map
