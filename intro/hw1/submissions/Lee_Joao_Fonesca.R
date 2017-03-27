#Section 1
version$minor
install.packages('devtools')
library(devtools)
install.packages("RColorBrewer")
install.packages("data.table")
install.packages("dplyr")
install.packages('ggmap')
install.packages('gsheet')
install.packages('knitr')
install.packages('leaflet')
install.packages('maptools')
install.packages('raster')
install.packages('rgdal')
install.packages('rgeos')
install.packages('rmarkdown')
install.packages('sp')
install.packages('tidyr')
install.packages('tidyverse')
install.packages('tufte')
install.packages('cism')
install_github('databrew/databrew')
install.packages('extrafont')
install.packages('stringdist')
library(devtools)
install_github('joebrew/cism')

#Section 2
census <- read.csv('C:/Users/lfonseca/Documents/R course/r_classes/census.csv')

#Section 3
head(census)
nrow(census)
ncol(census)
colnames(census)
sex_table <- table(census$sex)
dim(sex_table)
head(sex_table)
prop.table(sex_table)
sex_table / nrow(census)
max(census$age)
min(census$age)
hist(census$age)
hist(census$age, breaks = 40, freq = F, main = "Histogram of age according sex", col = "green")
barplot(sex_table, width = 1, space = NULL, main = "Tabela de genero", col = c(1, 2))
?table
floor_table <- table(census$floor_material)
head(floor_table)
prop.table(floor_table)
bike.table <- table(census$bike)
barplot(bike.table, width = 1, space = NULL, main = "Pessoas com bicicleta", col = c(2, 4))
census$tv_and_car <- ifelse(census$tv == 'yes' & census$car == 'yes','Has TV and car',
         'Does not have TV and car')

###Section 4
head(census)
tv_and_car.table <- table(census$tv_and_car)
tv_and_car.table
head(tv_and_car.table)
xt <- table(census$tv_and_car, census$celular)
xt


#SECTION 5
library(cism)
library(sp)
plot(moz0, col = "orange")
plot(man2, main = "Mapa do distrito da Manhica", col = "green")
plot(man3)
plot(census$longitude, census$latitude, col="blue", main="Coordenadas Geograficas da tabela census")
plot(man3)
points(census$longitude, census$latitude)
cism_map(lng = census$longitude, lat = census$latitude)
?cism_map
cism_map_interactive(lng = census$longitude, lat = census$latitude)
