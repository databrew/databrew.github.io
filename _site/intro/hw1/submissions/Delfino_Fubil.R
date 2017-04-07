2+2
x<-c(1,2,3,4,5)
x
barplot(x)
a<-1
ages<-c(31,23,24,26,26,30)
ages[1]
ages[4]
sort(ages)
sorted_ages<=sort(ages)
min(ages)
    
max (ages)
mean(ages)
range(ages)
sd(ages)      
hist(ages)
frangos<- read.csv("C:/Users/dvubil/Desktop/Curso R/frangos.csv")
unique(frangos$Chick)
max(frangos$Time)
min(frangos$weight)
max(frangos$weight)
hist(frangos$weight)
hist(frangos=weight)
boxplot(frangos$weight)
frangos [1,1]
frangos [3,]
frangos [,2]
frango7<-frangos[frangos$Chick==7,]
belen<-frango7
plot(x= belen$Time, y= belen$weight, type='l', main="Frango development", xlab='Time (in days)', ylab='weight (grams)', lwd=3, col="pink", lty=4)
max(belen$Time)
max(belen$weight)
frangos$color <-'red'
frangos$color<-ifelse(frangos$Diet==1,'blue','grey')
plot(x=frangos$Time, y=frangos$weight, col=frangos$color, pch=8, xlab='Time', ylab='Grams', main='Diet 1 vs others diets')
diet2<-frangos[frangos$Diet==2,]
mean(diet2$weight)
hist(diet2$weight)
library(devtools)
install_github('databrew/databrew', dependencies = TRUE, force = TRUE)
install_github('joebrew/cism', dependencies = TRUE, force = TRUE)

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
library(devtools)
install_github('joebrew/cism', dependencies = TRUE, force = TRUE)
census <- read.csv ('C:/Users/dvubil/Desktop/Curso R/census.csv')
census []
census[row]
census[1,1]
census[1,]
census<-read ('row')
nrow(census)
ncol(census)
colnames(census)
sex_table <- table(census$sex)
tablecensus$sex
sex_table
sex
sex_table / nrow(census)
max('age')
max[ages]
max (age)
max (age$census)
max (census$age)
min(census$age)
hist(census$age)
barplot(sex_table)
floor_table <- table(census$floor)
floor_table
floor_table / nrow(census)
bike_table <- table(census$bike)
bike_table
barplot (bike_table)
tv_table <- table(census$tv)
barplot(tv_table)
tv_and_car_table <- table(census$tv)
barplot(tv_and_car_table)
census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')
tv_car_table
prop.table(tv_and_car_table)
census$tv_car_celular <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes' & census$celular =='yes',
         'Has TV, car, celular',
         'Does not have TV, car, celular')
tv_car_celular_table
census$tv_car_celular <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes' & census$celular =='yes',
         'Has TV, car, celular',
         'Does not have TV, car, celular')
census$tv_car_celular
table(census$tv_car_celular)
library(cism)
library(databrew)
library(sp)
plot(moz0)
plot(moz0, col = "orange")
plot(man2)
plot(man2, col = 'green', main = "Manhica District")
plot(moz3)
plot(census$longitude, xlab='longitude')
plot(moz2)
points(census$longitude, census$latitude)
cism_map(lng = census$longitude,
         lat = census$latitude)
cism_map_interactive(lng = census$longitude,
                     lat = census$latitude,
                     x = census$age)
