install.packages('devtools')

library(devtools) install_github('databrew/databrew', dependencies = TRUE, force = TRUE)

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
library(devtools) install_github('databrew/databrew', dependencies = TRUE, force = TRUE)

library(devtools)
install_github('databrew/databrew', dependencies = TRUE, force = TRUE)
library(devtools)
install_github('databrew/databrew', dependencies = TRUE, force = TRUE)

library(databrew)
install_packages()

library(devtools)
install_github('joebrew/cism', dependencies = TRUE, force = TRUE)

census <- databrew::census
row
nrow(census)
ncol(census)
colnames(census)

sex_table <- table(census$sex)
count(sex_table, sort = TRUE)
prop.table(sex_table)
sex_table / nrow(census)
max(census$age)
min(census$age)
hist(census$age, main = "Histogram from the Census Population", xlab = "Ages", ylab = "Frequeuncy")
plot(sex_table)
barplot(sex_table, main = "Females vs Males", ylab = "Frequency", xlim =, ylim = "6000")
barplot(sex_table, main = "Females vs Males in the Census Population", xlab="Frequeuncy", space = 0)

table(census$floor_material)
count(census$floor_material, if (census$floor_material)"Cement Marble")
floor_material<-table(census$floor_material)
table(census$floor_material)
(floor_material/nrow(census))*100

bike<-table(census$bike)
bike_table<-table(census$bike)
barplot(bike_table, main = "Gráfico de posse de bicicletas na população do Censo", xlab = "Posse", ylab = "Frequência", space = 0
        
        census$tv_and_car <-ifelse(census$tv == 'yes' & census$car == 'yes', 'Has TV and car','Does not have TV and car')
table(census$tv_and_car)
tv_and_car<-table(census$tv_and_car)
(tv_and_car/nrow(census))*100

xt<-table(census$tv_and_car, census$celular)
table(census$tv_and_car,census$celular)

library(cism)
library(sp)
plot(moz0)
plot(moz0, col="orange")
plot(man2)
plot(man2, col="green", main="Distrito da Manhiça - Província de Maputo, Moçambique")
plot(man3)
plot(man4)
plot(man3, main="Localidades do Distrito da Manhiça")
scatter.smooth(census$longitude,census$latitude)
plot(man2)
points(census$longitude, census$latitude)
cism_map(lng = census$longitude,lat = census$latitude)
cism_map?
cism_map_interactive(lng = census$longitude,lat = census$latitude)
